module IteratorAsArrayDisguises

"""
There are methods that dispatch on `AbstractArray`, but really don't use indexing, and just use `iterate`.
Use this type to hack around the  `::AbstractArray`.
"""
struct IteratorAsArrayDisguise{T, N, I} <: AbstractArray{T, N}
    iterator::I
end

# Many generators infer `eltype` to be `Any`, so this convenience constructor may not be all that useful
IteratorAsArrayDisguise(iterator) = IteratorAsArrayDisguise{eltype(iterator), 1, typeof(iterator)}(iterator)

# delegate
Base.iterate(a::IteratorAsArrayDisguise, args...) = iterate(a.iterator, args...)
# override definition in `arrayshow.jl`
Base.show(io::Base.IO, ::MIME"text/plain", adi::IteratorAsArrayDisguise) = show(io, "IteratorAsArrayDisguise{$(adi.iterator)}")



end # module
