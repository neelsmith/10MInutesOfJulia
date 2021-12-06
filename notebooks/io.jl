### A Pluto.jl notebook ###
# v0.17.1

using Markdown
using InteractiveUtils

# ╔═╡ 291ab116-539f-11ec-1682-9f7692797d20
md"""# IO

> TBA
>
> - read from a URL
> - dl a file; read from file
> - readlines
> - write to a file
> - overriding `Base.write`

Use a library outside the core Julia language:  `import`
(in REPL, requires adding first in Pkg)
"""

# ╔═╡ c54583a4-3b47-4763-b57f-3443a46f4755
import HTTP

# ╔═╡ da76461f-07b7-40fd-a3b9-93a37504cc4b
phonedataurl = "https://raw.githubusercontent.com/neelsmith/10MinutesOfJulia/main/data/contacts.cex"

# ╔═╡ 535498c6-26de-46ea-8137-81610565867b
fromurl = HTTP.get(phonedataurl).body |> String

# ╔═╡ 00ba6386-55d7-40e4-8994-a386f7c4a8e2
tempdl = download(phonedataurl)

# ╔═╡ b0726ab5-592f-4f0d-b943-63dc0208dedb
fromfile = read(tempdl, String)

# ╔═╡ f39609cd-f2d8-4fad-877a-97a24072dbe8
fromfile == fromurl

# ╔═╡ af34df88-fff3-401f-95e0-989ccedd17bb
Text(fromfile)

# ╔═╡ 1914edd5-7c8a-417c-b233-064e74ce1662
lines1 = readlines(tempdl)

# ╔═╡ 7944b600-f33a-47b2-8a3b-cc36c56e5bbd
typeof(lines1)

# ╔═╡ b06b5935-7395-4ca9-a7b1-a816b172e506
lines2 = split(fromurl, "\n")

# ╔═╡ 5eb455b1-0187-402f-a19d-238a156ddd1b
lines1 == lines2

# ╔═╡ 3f7028d3-9901-4d61-a92f-000dbf61e130
md"""## Overriding `Base.show`"""

# ╔═╡ 2ae637d7-174d-4fe1-adb6-3c954d6e7455
abstract type Phone end

# ╔═╡ 10a22711-d902-4a55-9ad6-9b8fe42c0bbb
"10-digit US phone number"
struct USPhone <: Phone
	areacode::AbstractString
	prefix::AbstractString
	digits::AbstractString
	function USPhone(s::AbstractString)
		new(s[1:3], s[4:6], s[7:10])
	end
	
end

# ╔═╡ 344dce21-8c54-427c-9715-709e8aacba12


# ╔═╡ c57c2816-eedc-4d7a-a4b1-799cc1a3372c
begin 
	import Base:  show
	function show(io::IO, usphone::USPhone)
		show(io, "+1 (" * usphone.areacode * ") " * usphone.prefix * "-" * usphone.digits)
	end
end

# ╔═╡ c83a1f78-16f4-45d7-9e22-692867c09da4
USPhone("1234357890")

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
HTTP = "cd3eb016-35fb-5094-929b-558a96fad6f3"

[compat]
HTTP = "~0.9.17"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[HTTP]]
deps = ["Base64", "Dates", "IniFile", "Logging", "MbedTLS", "NetworkOptions", "Sockets", "URIs"]
git-tree-sha1 = "0fa77022fe4b511826b39c894c90daf5fce3334a"
uuid = "cd3eb016-35fb-5094-929b-558a96fad6f3"
version = "0.9.17"

[[IniFile]]
deps = ["Test"]
git-tree-sha1 = "098e4d2c533924c921f9f9847274f2ad89e018b8"
uuid = "83e8ac13-25f8-5344-8a64-a9f2b223428f"
version = "0.5.0"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[MbedTLS]]
deps = ["Dates", "MbedTLS_jll", "Random", "Sockets"]
git-tree-sha1 = "1c38e51c3d08ef2278062ebceade0e46cefc96fe"
uuid = "739be429-bea8-5141-9913-cc70e7f3736d"
version = "1.0.3"

[[MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[Random]]
deps = ["Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[URIs]]
git-tree-sha1 = "97bbe755a53fe859669cd907f2d96aee8d2c1355"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.3.0"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
"""

# ╔═╡ Cell order:
# ╠═291ab116-539f-11ec-1682-9f7692797d20
# ╠═c54583a4-3b47-4763-b57f-3443a46f4755
# ╠═da76461f-07b7-40fd-a3b9-93a37504cc4b
# ╠═535498c6-26de-46ea-8137-81610565867b
# ╠═00ba6386-55d7-40e4-8994-a386f7c4a8e2
# ╠═b0726ab5-592f-4f0d-b943-63dc0208dedb
# ╠═f39609cd-f2d8-4fad-877a-97a24072dbe8
# ╠═af34df88-fff3-401f-95e0-989ccedd17bb
# ╠═1914edd5-7c8a-417c-b233-064e74ce1662
# ╠═7944b600-f33a-47b2-8a3b-cc36c56e5bbd
# ╠═b06b5935-7395-4ca9-a7b1-a816b172e506
# ╠═5eb455b1-0187-402f-a19d-238a156ddd1b
# ╟─3f7028d3-9901-4d61-a92f-000dbf61e130
# ╠═2ae637d7-174d-4fe1-adb6-3c954d6e7455
# ╠═10a22711-d902-4a55-9ad6-9b8fe42c0bbb
# ╠═344dce21-8c54-427c-9715-709e8aacba12
# ╠═c57c2816-eedc-4d7a-a4b1-799cc1a3372c
# ╠═c83a1f78-16f4-45d7-9e22-692867c09da4
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
