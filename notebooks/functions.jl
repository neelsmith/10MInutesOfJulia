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

# ╔═╡ 7baed31b-762d-498d-82f8-65d6486fbb61
md"""## Error checking strings for a `USPhone`
"""

# ╔═╡ 0b01988f-5e7b-48f3-9038-d0714b167aca
md"""## Error checking strings for a `BelgianPhone`
"""

# ╔═╡ 25c85cc9-7f00-4262-bffb-9de5302662d5
md"""
Orange phone in Brussels
 +32 02 218 62 07

Proximus in Louvain
· +32 010 23 36 59
"""

# ╔═╡ 49b6abf5-5526-4b1c-a01e-339e5eb8674b
belgianbigcities = ["02", "03", "04", "09"]

# ╔═╡ bb6cf6bf-18e9-46a3-a4a3-dfe88c49ca81
md"""## String formatting by type"""

# ╔═╡ 8f8f1619-759e-42a4-94ed-276bf75d7f0a
md"""## Types
"""

# ╔═╡ f38dcd10-e179-485a-9d0e-77b0d3fae633
abstract type Phone end

# ╔═╡ 5897e8b4-62fc-4934-9b18-1b07ac909979
abstract type Contact end

# ╔═╡ 45b16c5a-14a1-40fd-9f66-59d112afcb23
"10-digit US phone number"
struct USPhone <: Phone
	areacode
	prefix
	digits
end

# ╔═╡ 08120255-6260-4437-921d-fbcb99c95447
"""Construct a `USPhone` from a string value.

Throw a `DomainError` if the string is not valid.
"""
function usphone(s::AbstractString)
	digits = []
	for ch in s
		if isdigit(ch)
			push!(digits, ch)
		end
	end
	if length(digits) == 10
		USPhone(s[1:3], s[4:6], s[7:10])
	else
		throw(DomainError(s, "US Phones should be ten digits long"))
	end
end


# ╔═╡ bd461172-d4b4-4eb3-a3ff-31f8aed2a4a9
usphone("123456789c")

# ╔═╡ f39ab6d7-8bb9-41ed-8b16-47b7365fbed2
"""Format a `USPhone` in standard display."""
function formattedphone(us::USPhone; international = false)
	tendigits = "(" * us.areacode * ") " * us.prefix * "-" * us.digits
	if international
		"+1 " * tendigits
	else
		tendigits
	end
end

# ╔═╡ b9982bfb-8d5d-4af8-a983-c9ec87b99883
kris = USPhone("951",  "262", "3062")

# ╔═╡ 10688be7-c898-4153-8687-deca2d6822f4
"9- or 10-digit Belgian phone number"
struct BelgianPhone <: Phone
	areacode
	subscriber
end

# ╔═╡ 6c069e1b-f60d-48d3-b205-13ceded8958d
 Dict(
	 "+32" => BelgianPhone,
	 "+1" => USPhone
 )

# ╔═╡ 6eb76538-890c-4f34-aa63-6e907e78d0ac
"Construct a `BelgianPhone` from a string."
function belgianPhone(s::AbstractString)
	if s[1] != '0'
		throw(DomainError(s, "Phones should start with '0'"))
	end
	# 10 digits = mobile
	if length(s) == 10 && startswith(s, "04") # mobile
		BelgianPhone(s[1:4], s[5:10])
	elseif length(s) == 9 # land line
		
	else
		# error!
		throw(DomainError(s, "Phones should be 9 or 10 digits"))
	end
end

# ╔═╡ 69c1e734-dc04-412f-acd4-12c6b8d77ca7
belgianPhone("0411111111")

# ╔═╡ 3d0bf2e1-fd67-45de-a43d-6c75bab56807
belgianPhone("4011111111")

# ╔═╡ 05f7a408-f89c-42cb-8b15-ddf1d73c71bb
function belgianbigcity(ph::BelgianPhone)
	
	if  ph.areacode[1:2] in belgianbigcities
		true
	else
		false
	end

end

# ╔═╡ b8313348-e551-4023-89b6-016b4ab23045
function formattedphone(belgian::BelgianPhone; international = false)
	#2-555-12-12 
	#
	formatteddigits = 	if bigcity(belgian)
		belgian.areacode[1] * "-" * belgian.areacode[2-4]
	else
	end
		
	#
	tendigits = "(" * us.areacode * ") " * us.prefix * "-" * us.digits
	if international
		"+32 " * tendigits
	else
		tendigits
	end
end

# ╔═╡ 70671756-7b02-424f-b67e-ce3632b1f768
formattedphone(kris)

# ╔═╡ 2cd6b174-c630-4fec-a01e-b83e91a8bc2b
formattedphone(kris, international = true)

# ╔═╡ bc29fcc5-1e70-4d6f-89a2-2f9d9489f9bd
orangephone = BelgianPhone("0218", "6207")

# ╔═╡ Cell order:
# ╟─a62c27e9-789a-4495-b7dc-229ecd0eaf18
# ╠═d0c3985a-5387-11ec-1f7a-1f3d95a47e18
# ╠═1a81efc8-9136-417c-a2ac-67f2fc699f15
# ╠═6c069e1b-f60d-48d3-b205-13ceded8958d
# ╟─7baed31b-762d-498d-82f8-65d6486fbb61
# ╠═08120255-6260-4437-921d-fbcb99c95447
# ╠═bd461172-d4b4-4eb3-a3ff-31f8aed2a4a9
# ╟─0b01988f-5e7b-48f3-9038-d0714b167aca
# ╠═25c85cc9-7f00-4262-bffb-9de5302662d5
# ╠═6eb76538-890c-4f34-aa63-6e907e78d0ac
# ╠═49b6abf5-5526-4b1c-a01e-339e5eb8674b
# ╠═69c1e734-dc04-412f-acd4-12c6b8d77ca7
# ╠═3d0bf2e1-fd67-45de-a43d-6c75bab56807
# ╠═05f7a408-f89c-42cb-8b15-ddf1d73c71bb
# ╟─bb6cf6bf-18e9-46a3-a4a3-dfe88c49ca81
# ╟─f39ab6d7-8bb9-41ed-8b16-47b7365fbed2
# ╠═b8313348-e551-4023-89b6-016b4ab23045
# ╠═b9982bfb-8d5d-4af8-a983-c9ec87b99883
# ╠═70671756-7b02-424f-b67e-ce3632b1f768
# ╠═2cd6b174-c630-4fec-a01e-b83e91a8bc2b
# ╠═bc29fcc5-1e70-4d6f-89a2-2f9d9489f9bd
# ╟─8f8f1619-759e-42a4-94ed-276bf75d7f0a
# ╠═f38dcd10-e179-485a-9d0e-77b0d3fae633
# ╠═5897e8b4-62fc-4934-9b18-1b07ac909979
# ╟─45b16c5a-14a1-40fd-9f66-59d112afcb23
# ╠═10688be7-c898-4153-8687-deca2d6822f4
