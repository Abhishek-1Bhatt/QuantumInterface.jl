samebases(a::AbstractOperator) = samebases(a.basis_l, a.basis_r)::Bool
samebases(a::AbstractOperator, b::AbstractOperator) = samebases(a.basis_l, b.basis_l)::Bool && samebases(a.basis_r, b.basis_r)::Bool
check_samebases(a::AbstractOperator) = check_samebases(a.basis_l, a.basis_r)
multiplicable(a::AbstractOperator, b::AbstractOperator) = multiplicable(a.basis_r, b.basis_l)
dagger(a::AbstractOperator) = arithmetic_unary_error("Hermitian conjugate", a)
transpose(a::AbstractOperator) = arithmetic_unary_error("Transpose", a)
directsum(a::AbstractOperator...) = reduce(directsum, a)
ptrace(a::AbstractOperator, index) = arithmetic_unary_error("Partial trace", a)
_index_complement(b::CompositeBasis, indices) = complement(length(b.bases), indices)
reduced(a, indices) = ptrace(a, _index_complement(basis(a), indices))