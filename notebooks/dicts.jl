### A Pluto.jl notebook ###
# v0.17.1

using Markdown
using InteractiveUtils

# ╔═╡ 0725d6ae-e4ba-40a6-abe6-a0daa4bdd6a9
md"""

- *Notebook version*: **0.1.0**
- *Prerequisites*:  ??
"""

# ╔═╡ 14430aac-5509-11ec-0216-c584bfb796e9
md"# Dictionaries"

# ╔═╡ 6cb9a4fc-765a-4352-8a22-b737cb8218b8
bigcitydict = Dict(
	"02" => "Brussels", 
	"03" => "Antwerp, Sint Niklaas", 
	"04" => "Liège, Voerens", 
	"09" => "Ghent"
)

# ╔═╡ e6f57d45-389d-4882-9f07-f0f767ed89d5
phone1 = "022186207"

# ╔═╡ 5ea947a6-5919-4a65-885b-7854ebd904f1
if haskey(bigcitydict, phone1[1:2])
	"$(phone1) is for $(bigcitydict[phone1[1:2]])"
else
	"$(phone1) is for a smaller city"
end
	

# ╔═╡ 67e61a37-e468-4718-805e-521cc777f09a
internationalphone1 = "+32 " * phone1

# ╔═╡ 730bb1ea-8d09-4efb-a4cf-223ed34d4b6d
md"""## Types
"""

# ╔═╡ c5e45ed9-43eb-4c28-8154-061c079a7962
abstract type Phone end

# ╔═╡ f6d37f49-f029-4f3f-a5be-e7bc42fccd92
"9- or 10-digit Belgian phone number"
struct BelgianPhone <: Phone
	areacode::AbstractString
	subscriber::AbstractString
end

# ╔═╡ f64e0899-f646-486c-b9fc-687c23bb9f58
"10-digit US phone number"
struct USPhone <: Phone
	areacode::AbstractString
	prefix::AbstractString
	digits::AbstractString
	function USPhone(s::AbstractString)
		new(s[1:3], s[4:6], s[7:10])
	end
	
end

# ╔═╡ 0411bf5c-d1fc-42c8-8f67-42c05e1152f5
 Dict(
	 "+32" => BelgianPhone,
	 "+1" => USPhone
 )

# ╔═╡ Cell order:
# ╠═0725d6ae-e4ba-40a6-abe6-a0daa4bdd6a9
# ╠═14430aac-5509-11ec-0216-c584bfb796e9
# ╠═6cb9a4fc-765a-4352-8a22-b737cb8218b8
# ╠═e6f57d45-389d-4882-9f07-f0f767ed89d5
# ╠═5ea947a6-5919-4a65-885b-7854ebd904f1
# ╠═0411bf5c-d1fc-42c8-8f67-42c05e1152f5
# ╠═67e61a37-e468-4718-805e-521cc777f09a
# ╠═730bb1ea-8d09-4efb-a4cf-223ed34d4b6d
# ╠═c5e45ed9-43eb-4c28-8154-061c079a7962
# ╠═f6d37f49-f029-4f3f-a5be-e7bc42fccd92
# ╠═f64e0899-f646-486c-b9fc-687c23bb9f58
