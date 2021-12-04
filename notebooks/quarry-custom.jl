### A Pluto.jl notebook ###
# v0.17.1

using Markdown
using InteractiveUtils

# ╔═╡ 1d33a49b-764b-4036-8815-035173a1cb13
md"""

- *Notebook version*: **0.1.0**
- *Prerequisite notebooks*:   [objects, types and variables](https://neelsmith.github.io/10MinutesOfJulia/fundamentals/types.html)
"""

# ╔═╡ aacf30aa-5387-11ec-38fd-15f7ed2c15c8
md"""# Custom types

> TBD
"""

# ╔═╡ f4951296-4a09-4ba2-9288-3a48e467babe
struct Book 
	author::AbstractString
	title::AbstractString
	isbn10
end

# ╔═╡ e565e35e-039a-4672-b6a7-01d29f28dac0
distant = Book("Ted Underwood", "Distant Horizons", "022661283X")

# ╔═╡ 1ba31d66-2567-4c2e-853a-8970db8a1d42
typeof(distant)

# ╔═╡ d2d9576a-2351-4e95-8c21-ada271536b40
distant.author

# ╔═╡ 6541d0a2-690e-498d-a54c-cad4c6f05f0a
distant.isbn10

# ╔═╡ 5f9d02af-1e6d-457e-a157-b7fa148e6c7f
distant.isbn10 |> typeof

# ╔═╡ Cell order:
# ╠═1d33a49b-764b-4036-8815-035173a1cb13
# ╟─aacf30aa-5387-11ec-38fd-15f7ed2c15c8
# ╠═f4951296-4a09-4ba2-9288-3a48e467babe
# ╠═e565e35e-039a-4672-b6a7-01d29f28dac0
# ╠═1ba31d66-2567-4c2e-853a-8970db8a1d42
# ╠═d2d9576a-2351-4e95-8c21-ada271536b40
# ╠═6541d0a2-690e-498d-a54c-cad4c6f05f0a
# ╠═5f9d02af-1e6d-457e-a157-b7fa148e6c7f
