### A Pluto.jl notebook ###
# v0.17.1

using Markdown
using InteractiveUtils

# ╔═╡ 76bf10f4-53a1-11ec-2844-79a067c21a9b
md"""# PlutoUI widgets

> TBA
"""

# ╔═╡ 99565dac-93ab-48da-b7e9-06b430d8ff23
"Format a list of items as a string with proper usage of Oxford comma."
function oxfordcomma(arr)
	commas = join(arr, ", ")
	parts = rsplit(commas, ", ", limit = 2)
	parts[1] * ", and " * parts[2]
	
end

# ╔═╡ e1563c8f-99c9-4a59-b192-b5381694d9e1
md"""## Types """

# ╔═╡ 93ab0da5-01fd-4e85-9061-10f580baadbd
abstract type Phone end

# ╔═╡ 15d8166e-14ef-4b6f-9e51-aa120085f23f
abstract type Contact end

# ╔═╡ ee7bd2b7-e8ba-493b-b211-df09b289a44a
"Contact card for a business"
struct Business <: Contact
	company::AbstractString
	phone::Phone
end

# ╔═╡ eba09ddf-2ab9-439d-a1f2-481700d422a1
"Contact card for a person."
struct Person <: Contact
	lastname::AbstractString
	firstname::AbstractString
	phone::Phone
end

# ╔═╡ 9a096f26-d1c6-498f-9223-5e3309117672
"9- or 10-digit Belgian phone number"
struct BelgianPhone <: Phone
	areacode::AbstractString
	subscriber::AbstractString
end

# ╔═╡ ba0c1062-0b94-4a2c-991d-c70a0672a72b
"10-digit US phone number"
struct USPhone <: Phone
	areacode::AbstractString
	prefix::AbstractString
	digits::AbstractString
end

# ╔═╡ Cell order:
# ╠═76bf10f4-53a1-11ec-2844-79a067c21a9b
# ╟─99565dac-93ab-48da-b7e9-06b430d8ff23
# ╟─e1563c8f-99c9-4a59-b192-b5381694d9e1
# ╠═93ab0da5-01fd-4e85-9061-10f580baadbd
# ╠═15d8166e-14ef-4b6f-9e51-aa120085f23f
# ╟─ee7bd2b7-e8ba-493b-b211-df09b289a44a
# ╟─eba09ddf-2ab9-439d-a1f2-481700d422a1
# ╟─9a096f26-d1c6-498f-9223-5e3309117672
# ╟─ba0c1062-0b94-4a2c-991d-c70a0672a72b
