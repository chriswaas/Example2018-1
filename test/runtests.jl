using Example2018
using Test

#@show Polynomial([1,2,3])
#@show evaluate(Polynomial([1,2,3]), 2)
#@show Polynomial([1,2,3]) + Polynomial([4,5])
#@show 3 * Polynomial([1,2,4,42])
#@show deriv(Polynomial([1,1,1,1,1]))
#@show deriv(Polynomial([0,0,1,0,0]))

# Polynomials for a ring
# 1. addition is associative
# 2. additive identity
# 3. additive inverse
# 4. addition commutes
# 5. multiplication is ...

@testset "Polynomials form a ring" begin

  z = Polynomial([0])
  e = Polynomial([1])
  for n in 1:100
    deg = rand(0:100)
    c = rand(-200:200)
    p = Polynomial(rand(-1000000:1000000, deg+1))
    q = Polynomial(rand(-1000000:1000000, deg+1))
    r = Polynomial(rand(-1000000:1000000, deg+1))

    @test p+z == p
    @test z+p==p
    @test e*p == p
    @test p*e == p
    @test p+(-p)==z
    @test (p+q)+r == p+(q+r)
    @test p+q == q+p
    @test (p*q)*r == p*(q*r)
    @test p*q*c == c*q*p
    @test p*(q+r) == p*q + p*r
    @test (p+q)*r == p*r + q*r
  end
end
