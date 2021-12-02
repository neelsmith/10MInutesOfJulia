### A Pluto.jl notebook ###
# v0.17.1

using Markdown
using InteractiveUtils

# ╔═╡ 7deebfca-c352-488c-a9fa-3c40e583126c
md"""

- *Notebook version*: **0.2.0**
- *Prerequisites*:  none
"""

# ╔═╡ 33b1d6be-5371-11ec-306b-9360e2f906ec
md"# Types and values"

# ╔═╡ 902f7779-08f7-46b9-83ec-e58aa56b226c
md"""## Concepts

> TBA
"""

# ╔═╡ 63847950-1a62-490c-9c5d-cd7ab82e937e
md"Show and tell:"

# ╔═╡ 89e923c5-e68a-47ac-bbc0-e4249e2fdb82
"Iliad"

# ╔═╡ fade998f-152a-4cb0-8aec-fddd75dc0b3f
title = "Iliad"

# ╔═╡ 8e726110-5a49-4ead-a6d6-b1bd15929cf2
typeof(title)

# ╔═╡ f74cddba-0b7a-4039-8c4e-706b41c0c249
typeof(title) |> supertype

# ╔═╡ 8c7d0ae6-f83c-4dd1-8cec-b44f575fc3b8
24

# ╔═╡ 6efec1a6-71c7-4cdd-99b7-da5379b20390
books = 24

# ╔═╡ a309ea2f-e7ff-491c-8bd7-9b1f236ef30d
typeof(books)

# ╔═╡ bec93a17-5416-484f-9ec1-7ed070eca037
typeof(24) |> supertype |> supertype

# ╔═╡ e190c422-6fe7-407d-89f9-b9c7ec5852ab
"Iliad"

# ╔═╡ e5a306c4-f3c1-48c1-83fa-b3b852c28246
'I'

# ╔═╡ 9581f15a-e0ff-4d66-9e4f-bedc850a709a
'α'

# ╔═╡ b471850e-5907-4943-9c3c-a34e93cf7532
books == 24

# ╔═╡ 3dbaf3ab-be11-4cea-95c0-af4b951533a3
checkcount = books == 24

# ╔═╡ eaaf6abb-1488-46da-af65-d448365d910c
typeof(checkcount)

# ╔═╡ Cell order:
# ╠═7deebfca-c352-488c-a9fa-3c40e583126c
# ╟─33b1d6be-5371-11ec-306b-9360e2f906ec
# ╟─902f7779-08f7-46b9-83ec-e58aa56b226c
# ╟─63847950-1a62-490c-9c5d-cd7ab82e937e
# ╠═89e923c5-e68a-47ac-bbc0-e4249e2fdb82
# ╟─fade998f-152a-4cb0-8aec-fddd75dc0b3f
# ╠═8e726110-5a49-4ead-a6d6-b1bd15929cf2
# ╠═f74cddba-0b7a-4039-8c4e-706b41c0c249
# ╠═8c7d0ae6-f83c-4dd1-8cec-b44f575fc3b8
# ╠═6efec1a6-71c7-4cdd-99b7-da5379b20390
# ╠═a309ea2f-e7ff-491c-8bd7-9b1f236ef30d
# ╠═bec93a17-5416-484f-9ec1-7ed070eca037
# ╠═e190c422-6fe7-407d-89f9-b9c7ec5852ab
# ╠═e5a306c4-f3c1-48c1-83fa-b3b852c28246
# ╠═9581f15a-e0ff-4d66-9e4f-bedc850a709a
# ╠═b471850e-5907-4943-9c3c-a34e93cf7532
# ╠═3dbaf3ab-be11-4cea-95c0-af4b951533a3
# ╠═eaaf6abb-1488-46da-af65-d448365d910c
