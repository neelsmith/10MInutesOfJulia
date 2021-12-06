### A Pluto.jl notebook ###
# v0.17.1

using Markdown
using InteractiveUtils

# ╔═╡ 26cc2a51-2e2b-459c-8e5a-e3d7bb55d918
md"""

- *Notebook version*: **0.1.0**
- *Prerequisites*:  **types**, and **customtypes** notebooks
"""

# ╔═╡ e87c9104-5387-11ec-1ba2-1fd2cde44d32
md"""# Strings and Arrays

> TBA

As array:
- indexing; `end` as index
- iteration with `for`
- `push!` and mutable/immutable objects
- filter
- map

String specials
- interopolation
- triple quote
- split; with limit; rsplit
- replace




"""

# ╔═╡ 9357a67f-fbde-4120-996c-70809bd552af
belgianbigcities = ["02", "03", "04", "09"]

# ╔═╡ 6cc3df14-aa16-4687-9702-fe9bb2e0b45d
phone1 = "022186207"

# ╔═╡ 4c08c47e-6808-4d0f-a028-62100a6ae7c9
phone2 = "010233659"

# ╔═╡ 80bfe858-f46b-48a1-9962-e2ce9e86d162
if phone1[1:2] in belgianbigcities
	"$(phone1) is a big city"
	
else
	"$(phone1) is not such a big city"
end


# ╔═╡ 59ce0baa-2eff-4b60-8481-b40d67b4a37b
if phone2[1:2] in belgianbigcities
	"$(phone2) is a big city"
	
else
	"$(phone2) is not such a big city"
end

# ╔═╡ 06cbbd1a-f2e1-4001-ab6c-2cb31fc7a67e
if phone1[1:2] in belgianbigcities
	pieces1 = [
		phone1[1:2],
		phone1[3:5],
		phone1[6:7],
		phone1[8:9]
	]
	 join(pieces1,"-")
else
	pieces1 = [
		phone1[1:3],
		phone1[4:5],
		phone1[6:7],
		phone1[8:9]
	]
	join(pieces1,"-")
end

# ╔═╡ 8f5b35ad-dcd9-4867-8ec9-e2136dd03095
if phone2[1:2] in belgianbigcities
	pieces2 = [
		phone2[1:2],
		phone2[3:5],
		phone2[6:7],
		phone2[8:9]
	]
	 join(pieces2,"-")
else
	pieces2 = [
		phone2[1:3],
		phone2[4:5],
		phone2[6:7],
		phone2[8:9]
	]
	join(pieces2,"-")
end

# ╔═╡ 3b10f0e9-8e90-4a84-b94e-b880a78f7580
html"""

<br/><br/><br/><br/><br/>
<hr/><br/>
<p>Old to quarry</p>
"""

# ╔═╡ af713e4c-fee1-450c-ae0f-3091a2cbc877
s1 = "word"

# ╔═╡ d5197da0-4881-44f3-bc2d-76efdfafb797
s2 = """Longer string,
even including new line character.
"""

# ╔═╡ 4758fd91-780d-40cc-9ed9-9ab883871bc8
lines = split(s2, "\n")

# ╔═╡ aca45f10-bf04-4024-964d-47a061e7bba9
lines |> typeof

# ╔═╡ 1de9c05a-5fe5-46a1-b5b0-2415da04b7a6
struct Book 
	author::AbstractString
	title::AbstractString
	isbn10
end

# ╔═╡ 7c87a883-7a9e-4eae-860d-71db81fa2d3c
qi = Book("Christopher W. Forstall and Walter J. Scheirer", "Quantitative Intertextuality:  Analyzing the Markers of Information Reuse", "3030234134")

# ╔═╡ 42f935ce-f26d-496c-80dd-2e4528fe8a73
(maintitle, subtitle) = split(qi.title, ":")

# ╔═╡ 660865aa-dac2-4196-84ae-b17654bd373a
strip(subtitle)

# ╔═╡ 049ea299-9811-405b-9f38-a8ae5f2588c4
(split(subtitle)) .|> uppercasefirst

# ╔═╡ 7525cf9a-389f-4d72-8dfa-e8599fec9c99
join(uppercasefirst.(split(subtitle)) , " ")

# ╔═╡ b59adfab-33db-4b58-b75f-d52cf756e2b1
function titleize(s)
	ignore = ["of", "and", "the", "a", "an", "for", "is"]
	words = split(s)
	titlewords = []
	for w in words
		w in ignore ? push!(titlewords, w) : push!(titlewords, uppercasefirst(w))
	end
	join(titlewords, " ")
end

# ╔═╡ f4911c1a-5f9d-464e-8ef9-75218314cb9e
titleize("This is a candidate for a title")

# ╔═╡ 6ec0afff-3141-424a-8be8-59552d298cb2
html"""

<br/><br/><br/><br/>
<hr/>
<p>Look at this later:</p>
"""

# ╔═╡ 0aeb95ef-0484-4d65-90b3-0361fd9f83a9
function checkisbn10sum(isbn10::AbstractString)
	if length(isbn10) != 10
		"Error!  isbn must be 10 digits long."
	else
		
		checksum = isbn10[10] == "X" ? 10 : parse(Int64, isbn10[10])
		total = 0
		places = 10
		for i in 1:9
			total = total + parse(Int64, isbn10[i]) * places
			places = places -1
		end
		mod( 11 - total, 11)  == checksum
		
	end
end

# ╔═╡ f9c82ec8-dd98-4488-940a-9fb7d0bd3390
checkisbn10sum("0306406152")

# ╔═╡ Cell order:
# ╟─26cc2a51-2e2b-459c-8e5a-e3d7bb55d918
# ╠═e87c9104-5387-11ec-1ba2-1fd2cde44d32
# ╠═9357a67f-fbde-4120-996c-70809bd552af
# ╠═6cc3df14-aa16-4687-9702-fe9bb2e0b45d
# ╠═4c08c47e-6808-4d0f-a028-62100a6ae7c9
# ╠═80bfe858-f46b-48a1-9962-e2ce9e86d162
# ╠═59ce0baa-2eff-4b60-8481-b40d67b4a37b
# ╠═06cbbd1a-f2e1-4001-ab6c-2cb31fc7a67e
# ╠═8f5b35ad-dcd9-4867-8ec9-e2136dd03095
# ╠═3b10f0e9-8e90-4a84-b94e-b880a78f7580
# ╠═af713e4c-fee1-450c-ae0f-3091a2cbc877
# ╟─d5197da0-4881-44f3-bc2d-76efdfafb797
# ╠═4758fd91-780d-40cc-9ed9-9ab883871bc8
# ╠═aca45f10-bf04-4024-964d-47a061e7bba9
# ╠═1de9c05a-5fe5-46a1-b5b0-2415da04b7a6
# ╠═7c87a883-7a9e-4eae-860d-71db81fa2d3c
# ╠═42f935ce-f26d-496c-80dd-2e4528fe8a73
# ╠═660865aa-dac2-4196-84ae-b17654bd373a
# ╠═049ea299-9811-405b-9f38-a8ae5f2588c4
# ╠═7525cf9a-389f-4d72-8dfa-e8599fec9c99
# ╠═b59adfab-33db-4b58-b75f-d52cf756e2b1
# ╠═f4911c1a-5f9d-464e-8ef9-75218314cb9e
# ╟─6ec0afff-3141-424a-8be8-59552d298cb2
# ╠═0aeb95ef-0484-4d65-90b3-0361fd9f83a9
# ╠═f9c82ec8-dd98-4488-940a-9fb7d0bd3390
