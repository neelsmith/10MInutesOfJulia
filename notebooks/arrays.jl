### A Pluto.jl notebook ###
# v0.17.1

using Markdown
using InteractiveUtils

# ╔═╡ 061e6b80-5388-11ec-32ee-4b120157f301
md"""# Arrays

>TBA
"""

# ╔═╡ 9a31cd5c-796b-49b4-a2ef-505c133fdc4e
md"""
- Strings are arrays of chars
- iteration with `for`
- `push!` and mutable/immutable objects

"""

# ╔═╡ 3101b0b9-2675-4b49-9b2f-7dcb75fcda50


# ╔═╡ ecb93a4a-56d5-48cd-808c-7af977c7b171
fourscore = "Four score and seven years ago our fathers brought forth, on this continent, a new nation, conceived in Liberty, and dedicated to the proposition that all men are created equal"

# ╔═╡ 0d7690b7-a544-45c8-9bc9-a7515f6a2b49
nocommas = replace(fourscore, "," => "")

# ╔═╡ 6c0f7361-e109-4b49-9f38-9859c9e8ec58
words = split(nocommas)

# ╔═╡ ebe97d7a-9f29-46d0-a9f3-98d203729231
alllower = lowercase.(words)

# ╔═╡ 702f72e5-4725-4323-b81e-0981fd1512e2
alllower[1]

# ╔═╡ 7e0f335f-9b3c-473e-a348-95c3e3b2e5cb
alllower[end]

# ╔═╡ ac886c51-e841-44d9-a77a-95f1cdfddcaf
words[1:6]

# ╔═╡ 7b845c31-c269-4a37-8d00-425cba093059
function firstn(s::AbstractString, n::Integer)
	words = split(s)
	join(words[1:n], " ")
end

# ╔═╡ 847b7cf2-8410-47c9-8289-84a9578c9df5
firstn(fourscore, 10)

# ╔═╡ df2d9a93-471e-46d0-b471-522ab6ddc746
function longwords(s::AbstractString; cutoff = 5)
	wordlist = split(s)
	filter(wd -> length(wd) > cutoff, wordlist) |> unique .|> lowercase
end

# ╔═╡ 937adc5b-9e68-47d2-915b-62b53440763b
longwords(nocommas)

# ╔═╡ 8c572dc1-a470-4a8e-aa8d-582cedff67ad
longwords(nocommas, cutoff = 8)

# ╔═╡ b4ca2871-bf2e-4809-831c-d6e44dfb1580
function clausepunct(s)
	split(s, r"[,:;\-]+") .|> strip
end

# ╔═╡ 21fed0c9-0050-4d33-ac3a-48271f96fe63
clausepunct(fourscore)

# ╔═╡ Cell order:
# ╟─061e6b80-5388-11ec-32ee-4b120157f301
# ╠═9a31cd5c-796b-49b4-a2ef-505c133fdc4e
# ╠═3101b0b9-2675-4b49-9b2f-7dcb75fcda50
# ╠═ecb93a4a-56d5-48cd-808c-7af977c7b171
# ╠═0d7690b7-a544-45c8-9bc9-a7515f6a2b49
# ╠═6c0f7361-e109-4b49-9f38-9859c9e8ec58
# ╠═ebe97d7a-9f29-46d0-a9f3-98d203729231
# ╠═702f72e5-4725-4323-b81e-0981fd1512e2
# ╠═7e0f335f-9b3c-473e-a348-95c3e3b2e5cb
# ╠═ac886c51-e841-44d9-a77a-95f1cdfddcaf
# ╠═7b845c31-c269-4a37-8d00-425cba093059
# ╠═847b7cf2-8410-47c9-8289-84a9578c9df5
# ╠═df2d9a93-471e-46d0-b471-522ab6ddc746
# ╠═937adc5b-9e68-47d2-915b-62b53440763b
# ╠═8c572dc1-a470-4a8e-aa8d-582cedff67ad
# ╠═b4ca2871-bf2e-4809-831c-d6e44dfb1580
# ╠═21fed0c9-0050-4d33-ac3a-48271f96fe63
