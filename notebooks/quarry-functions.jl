### A Pluto.jl notebook ###
# v0.17.1

using Markdown
using InteractiveUtils

# ╔═╡ a62c27e9-789a-4495-b7dc-229ecd0eaf18
md"""

- *Notebook version*: **0.1.0**
- *Prerequisites*:  **types**, **customtypes** notebooks
"""

# ╔═╡ d0c3985a-5387-11ec-1f7a-1f3d95a47e18
md"""# Functions

> TBA
"""

# ╔═╡ 1a81efc8-9136-417c-a2ac-67f2fc699f15


# ╔═╡ 55e52897-6934-46a2-9e31-1e12ff95bff5
piper2018 = "Enumerations: Data and Literary Study"

# ╔═╡ 44577ed1-ad42-4b34-a71c-6f4834eec4dc
lowercase(piper2018)

# ╔═╡ 7abd9bae-b329-47ca-ba7b-143c84539121
length(piper2018)

# ╔═╡ ac9fc0ee-1052-403b-a74b-e628ef554131
+(length(piper2018), 1)

# ╔═╡ 18ca454f-6a73-40ad-a256-0879def31532
length(piper2018) + 1

# ╔═╡ 1cdb1bb6-43ad-4f1d-b469-71062750a301
string(37)

# ╔═╡ 8bb31e64-8773-45d3-bffa-00f826f1d6a1
string(37) |> typeof

# ╔═╡ 0a28d424-47e3-4db5-934e-5cabadaa8900
struct Book 
	author::AbstractString
	title::AbstractString
	isbn10
end

# ╔═╡ d05434a8-b76e-4bbe-9ad4-a97d1e76f662
enumerations = Book("Andrew Piper", piper2018, "022656875X")

# ╔═╡ 0c13834c-c175-43a7-99b3-f740dba4c018
function author(book::Book)
	book.author
end

# ╔═╡ 0d67eced-9e6a-4953-9117-d2c70fb96237
author(enumerations)

# ╔═╡ c22ffa68-d881-4e69-87a0-9841fafc0ad1
function author2(book::Book; lastfirst = true)
	# Assume author is formatted as "FIRST LAST":
	names = split(book.author)
	
	if lastfirst
		names[2] * ", " * names[1]
	else
		book.author
	end
		
end

# ╔═╡ b040ddca-62a7-4cdd-843a-323c4e9a2831
author2(enumerations)

# ╔═╡ 51e0d1df-2f5a-4a8a-8351-6396dd75edef
author2(enumerations, lastfirst = false)

# ╔═╡ Cell order:
# ╟─a62c27e9-789a-4495-b7dc-229ecd0eaf18
# ╟─d0c3985a-5387-11ec-1f7a-1f3d95a47e18
# ╠═1a81efc8-9136-417c-a2ac-67f2fc699f15
# ╠═55e52897-6934-46a2-9e31-1e12ff95bff5
# ╠═44577ed1-ad42-4b34-a71c-6f4834eec4dc
# ╠═7abd9bae-b329-47ca-ba7b-143c84539121
# ╠═ac9fc0ee-1052-403b-a74b-e628ef554131
# ╠═18ca454f-6a73-40ad-a256-0879def31532
# ╠═1cdb1bb6-43ad-4f1d-b469-71062750a301
# ╠═8bb31e64-8773-45d3-bffa-00f826f1d6a1
# ╠═0a28d424-47e3-4db5-934e-5cabadaa8900
# ╠═d05434a8-b76e-4bbe-9ad4-a97d1e76f662
# ╠═0c13834c-c175-43a7-99b3-f740dba4c018
# ╠═0d67eced-9e6a-4953-9117-d2c70fb96237
# ╠═c22ffa68-d881-4e69-87a0-9841fafc0ad1
# ╠═b040ddca-62a7-4cdd-843a-323c4e9a2831
# ╠═51e0d1df-2f5a-4a8a-8351-6396dd75edef
