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

# ╔═╡ 0ccbcfd5-b63f-4cbb-85ff-1d3917b79224
md"""## Functions to read text data

"""

# ╔═╡ 14832caa-4b7d-405a-bc32-2d437bf4d572
#contact(kringle)

# ╔═╡ 01f82053-645f-44a8-85a7-31cb29439e69
"Construct a `Business` contact"
function business(name::AbstractString, phone::AbstractString)
end

# ╔═╡ cf367244-3a39-45f0-ba8e-9e86bf62493c
kringle = "Kringle, Kris|Person|+1 (951) 262-3062"

# ╔═╡ 5cf798a7-f94e-4ae4-a04f-295ac27107e7


# ╔═╡ 6aa1cda1-0430-4418-ae2c-597b4f3d4407


# ╔═╡ d4ff8f50-b1d7-491a-97a7-5391d29fcc54


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
	function USPhone(s::AbstractString)
		new(s[1:3], s[4:6], s[7:10])
	end
	
end

# ╔═╡ 48b960f3-8673-4590-a903-4396771f49bd
"""Dictionary of `Phone` subtypes"""
nationalcodes = Dict(
	"1" => USPhone,
	"32" => BelgianPhone
)

# ╔═╡ 6caacd39-6ef0-4d3e-9cbc-afd3f65772e2
"""Construct a `Phone` from a string value by looking up the subtype of `Phone`
in the `nationalcodes` dictionary, and passing to it a string of raw digits.
"""
function phone(s::AbstractString)
	icode = match(r"\+([0-9]+)(.+)", s)
	rawdigits = replace(strip(icode.captures[2]), r"[^0-9]" => "")
	nationalcodes[icode.captures[1]](rawdigits)
end

# ╔═╡ 4b48bf35-1400-4ca6-8f89-e406602835b0
"Read a string of delimited-text data and create a `Contact` from it."
function contact(s::AbstractString; delimiter = "|")::Contact
	parts = split(s, delimiter)
	contact = if lowercase(parts[2]) == "person"
		Person(parts[1], phone(parts[3]))
		#person(parts[1], parts[3])
	elseif lowercase(parts[2]) == "business"
		business(parts[1], parts[3])
	end
end

# ╔═╡ 980c7294-0c03-4542-9318-419cc35a8691
begin
	xparts = split(kringle, "|")
	 lowercase(xparts[2]) == "person"
	typeof(xparts[1]) <: AbstractString
	phone(xparts[3])
	
end

# ╔═╡ 6d842a02-465f-4f36-b502-d206545f7a33
"Construct a `Person` contact."
function person(name::AbstractString, phonenumber::AbstractString)
	Person(name, phone(phonenumber))
end

# ╔═╡ 1a4d4ac8-409b-43d7-950e-155297eec40e
phone("+1 (951) 262-3062")

# ╔═╡ Cell order:
# ╟─76bf10f4-53a1-11ec-2844-79a067c21a9b
# ╟─99565dac-93ab-48da-b7e9-06b430d8ff23
# ╟─0ccbcfd5-b63f-4cbb-85ff-1d3917b79224
# ╠═4b48bf35-1400-4ca6-8f89-e406602835b0
# ╠═980c7294-0c03-4542-9318-419cc35a8691
# ╠═14832caa-4b7d-405a-bc32-2d437bf4d572
# ╠═01f82053-645f-44a8-85a7-31cb29439e69
# ╠═6d842a02-465f-4f36-b502-d206545f7a33
# ╠═6caacd39-6ef0-4d3e-9cbc-afd3f65772e2
# ╠═1a4d4ac8-409b-43d7-950e-155297eec40e
# ╠═cf367244-3a39-45f0-ba8e-9e86bf62493c
# ╠═5cf798a7-f94e-4ae4-a04f-295ac27107e7
# ╠═6aa1cda1-0430-4418-ae2c-597b4f3d4407
# ╠═d4ff8f50-b1d7-491a-97a7-5391d29fcc54
# ╟─48b960f3-8673-4590-a903-4396771f49bd
# ╟─e1563c8f-99c9-4a59-b192-b5381694d9e1
# ╠═93ab0da5-01fd-4e85-9061-10f580baadbd
# ╠═15d8166e-14ef-4b6f-9e51-aa120085f23f
# ╟─ee7bd2b7-e8ba-493b-b211-df09b289a44a
# ╟─eba09ddf-2ab9-439d-a1f2-481700d422a1
# ╠═9a096f26-d1c6-498f-9223-5e3309117672
# ╠═ba0c1062-0b94-4a2c-991d-c70a0672a72b
