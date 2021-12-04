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
md"""
- parameters
- type annotations
- default values
- optional parameters
- piping
"""

# ╔═╡ 3cec81c4-73fa-4135-b035-c081171265e5
abstract type Phone end

# ╔═╡ 45b16c5a-14a1-40fd-9f66-59d112afcb23
"10-digit US phone number"
struct USPhone <: Phone
	areacode
	prefix
	digits
end

# ╔═╡ 10688be7-c898-4153-8687-deca2d6822f4
"9- or 10-digit Belgian phone number"
struct BelgianPhone <: Phone
	areacode
	subscriber
end

# ╔═╡ 25c85cc9-7f00-4262-bffb-9de5302662d5
md"""
Orange phone in Brussels
 +32 2 218 62 07

Proximus in Louvain
· +32 10 23 36 59
"""

# ╔═╡ Cell order:
# ╟─a62c27e9-789a-4495-b7dc-229ecd0eaf18
# ╟─d0c3985a-5387-11ec-1f7a-1f3d95a47e18
# ╠═1a81efc8-9136-417c-a2ac-67f2fc699f15
# ╠═3cec81c4-73fa-4135-b035-c081171265e5
# ╠═45b16c5a-14a1-40fd-9f66-59d112afcb23
# ╠═10688be7-c898-4153-8687-deca2d6822f4
# ╠═25c85cc9-7f00-4262-bffb-9de5302662d5
