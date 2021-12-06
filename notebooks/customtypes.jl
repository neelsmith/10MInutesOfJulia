### A Pluto.jl notebook ###
# v0.17.1

using Markdown
using InteractiveUtils

# ╔═╡ 1d33a49b-764b-4036-8815-035173a1cb13
md"""

- *Notebook version*: **1.0.0**
- *Prerequisite notebooks*:   [objects, types and variables](https://neelsmith.github.io/10MinutesOfJulia/fundamentals/types.html)
"""

# ╔═╡ aacf30aa-5387-11ec-38fd-15f7ed2c15c8
md"""# Custom types


In the 10-minute notebook on [objects, types and variables](https://neelsmith.github.io/10MinutesOfJulia/fundamentals/types.html), you saw examples of Julia types for strings, characters, numbers, and true/false values, and learned that they are related in a hierarchy that begins with the type `Any`.  All of these are built in to the Julia language, and available whenever you use Julia.
  But the world includes more than just strings of characters and numbers.  Julia lets you design your own types (called *composite types*).  

"""

# ╔═╡ 0a589e5f-f26d-4a88-a9ce-8806732b7a41
md"""
### Phone numbers

Consider a phone number.  In the "objects, types and variables" notebook, we treated a phone number as a simple string of characters.  But phone numbers are not arbitrary strings of characters: they have a defined structure.  Since Julia doesn't include a built-in type for phone numbers, we can design our own type.  We can distinguish parts of a phone number, like the area code.  We could even include national codes for internationl dialing.

"""

# ╔═╡ 9956a170-c1a8-4081-b2a7-ec219831510c
md"""
The [structure of phone numbers differs from country to country](https://en.wikipedia.org/wiki/National_conventions_for_writing_telephone_numbers).  We can use Julia's type hierarchy to model that by defining a `Phone` type that has subtypes for individual countries.

> ☞ Julia has *abstract* and *concrete* types. *Concrete types* have *fields,* whcih are named components of a structure The type hierarchy is defined by *abstract types* ; *bstract types* have no *fields*
"""

# ╔═╡ b2ed7b59-c360-4da4-847f-b94aed119341
md"""We'll start by defining an abstract type.  The following cell shows how you can do that.  We'll follow a standard Julia convention, and start all of our type names with upper-case letters.
"""

# ╔═╡ 4de4b5e0-26d7-46b1-8371-25012858f5e0
abstract type Phone end

# ╔═╡ d6cc4f99-ba2f-4d35-a2d2-dad89251f797
md"""
#### A type for US phone numbers
"""

# ╔═╡ 3a502c42-5679-4e6f-b5f6-23e9555b0d87
md"""Next, we'll define a type of US telephones with 10 digits (including area code).  We'll distinct the area code, the three-digit exchange, and the final four-digit number.

"""

# ╔═╡ 9a6f64c0-061a-492e-8aed-71da8e534c5a
"10-digit US phone number"
struct USPhone <: Phone
	areacode::AbstractString
	prefix::AbstractString
	digits::AbstractString
end

# ╔═╡ b1775158-1bf9-42d6-aa20-9aca2ddf85d7
md"""The definition begins with the keyword `struct` and ends with the keyword `end`.   We have preceded the definition with a quoted string value:  in this position, Julia will interpret that as documentation explaining the object.  (You can see in the Pluto display how it takes advantage of your comment.) It's a good idea to annotate in this way all the types and functions you create.

The name of our type is `USPhone`.  We use the same `<:` symbol you saw in our introduction of types to define `USPhone` as a subtype of our abstract type, `Phone`.  Finally, we list three fields named `areacode`, `prefix` and `digits`, and define their types by joining the name to a type name with `::`.

Now you can see why these custom types are called *composite types*: they just group together a set of objects, each of which has its own type.


> ⚠️ We've defined separate fields for area code, exchange, and individual number as `AbstractString`s, but have not yet done anything to guarantee that we use exactly three digits for area code, three for exchange, and four for remaining digits.  In the following [notebook introducing functions](https://neelsmith.github.io/10MinutesOfJulia/fundamentals/types.html), we'll improve our custom type by adding this kind of essential error checking.
"""

# ╔═╡ 64a7830e-3638-42d6-a162-0ca7d5074e5b
md"""

> ☞ To create a new object of your composite type, use the name of the type with a list of values in parentheses (one for each member of the object).  This is called a *constructor*.

"""

# ╔═╡ a4945eff-82c1-413f-95cd-b488b7f43a0e
verizonphone = USPhone("877", "596", "7577")

# ╔═╡ 6736740e-6b9a-4aff-91f5-9d98d9b3e938
typeof(verizonphone)

# ╔═╡ 463ee18f-2d90-4466-a77c-4a2fc885d9b4
supertype(USPhone)

# ╔═╡ db4bdcc1-3020-40fd-86d1-ad2a9528894e
USPhone <: Phone

# ╔═╡ 1afe0059-d2d1-410f-a8cd-db86a48bdf03
md"""
> ☞  Use dot-notation to refer to fields of a composite object.
"""

# ╔═╡ 8f44df7e-d954-405e-abf6-b113cd18fcfb
md"""
`verizon.areacode` is an object in its own right, for example.  Because we defined the type of our `areacode` field as an `AbstractString`, we can use *any* subtype of `AbstractString` in our constructor, as we can see in the following cells.
"""

# ╔═╡ 67212168-ef3d-44f3-9df5-99cd53fefb78
verizonphone.areacode

# ╔═╡ 3193f8ca-7159-40e6-a17d-bfd5030f0f16
typeof(verizonphone.areacode)

# ╔═╡ 49cba11a-5dc2-42fc-9be7-0a638a9fb735
supertype(typeof(verizonphone.areacode))

# ╔═╡ b611b970-af19-4332-aa3b-e4185689e8b0
md"""
Maybe we'd like to format a readable layout of our US phone number using Julia's `*` function to join two strings together.  (We'll see a better way to generalize this with a function in the 10-minute [introduction to functions](https://neelsmith.github.io/10MinutesOfJulia/fundamentals/types.html).)
"""

# ╔═╡ 2d4859de-680b-424a-81b7-c7a8db1078fc
"Verizon US phone: (" * verizonphone.areacode * ") " * verizonphone.prefix * "-" * verizonphone.digits

# ╔═╡ 15d525be-28a3-4e5c-86f1-185e5e13e4f9
md"""#### A type for Belgian phone numbers

"""

# ╔═╡ ffe4836b-be6e-48ca-9da5-42685cfdc4ed
md"""Phone numbers in Belgium follow a different convention. (See more about [telphone numbers in Europe](https://en.wikipedia.org/wiki/Telephone_numbers_in_Europe) on wikipedia.) They can have 9 or 10 digits, that is made up from an area code and a subscriber number.  We'll model it similarly to our `USPhone` type.
"""

# ╔═╡ 5ffb7ba2-52b9-4831-ac30-f0083ce17687
"9- or 10-digit Belgian phone number"
struct BelgianPhone <: Phone
	areacode::AbstractString
	subscriber::AbstractString
end

# ╔═╡ 645a978d-d0b8-4584-a0a3-53ae97bc3341
md"""Here's the contact number for Orange Phone in Brussels"""

# ╔═╡ 50be797a-11e8-4f17-a900-cfcdc7731171
orangephone = BelgianPhone("0218", "6207")

# ╔═╡ 4b56e1f2-ff76-457e-9d91-2a1747f3f30b
typeof(orangephone)

# ╔═╡ 81e46944-c980-405c-a0fa-373c9c2bb7f8
supertype(BelgianPhone)

# ╔═╡ 5a49e37b-5e5b-4de1-b05e-173bcec00d3b
md"""
### A contact list
"""

# ╔═╡ 8e97804c-bdb2-455f-9542-90620bb75151
md"""
Since both `USPhone` and `BelgianPhone` are subtypes of `Phone`, we can use either one wherever a `Phone` is acceptable.  Let's take advantage of that by defining another type of our own:  a listing for a personal contact list.

We can once more take advantage of Julia's type hierarchy so that we can include contacts for either businesses or for individuals.
"""

# ╔═╡ 9fde4cfa-dff5-41d2-bc15-00db9202fc5f
abstract type Contact end

# ╔═╡ ab699e2b-c106-456d-aeae-f150807ab645
md"""For businesses, we'll just record a company name and a phone."""

# ╔═╡ 9bb30356-9025-402b-bc8f-56a16d663983
"Contact card for a business"
struct Business <: Contact
	company::AbstractString
	phone::Phone
end

# ╔═╡ e90c18ed-4831-42a5-880c-c84403b67974
md"""We've already defined a couple of `Phone` objects. We'll use them now in contact listings."""

# ╔═╡ e7e09c11-d58a-480b-b91a-6ba049c562b5
verizon = Business("Verizon", verizonphone)

# ╔═╡ 6269ef53-82c0-4548-95f2-bc03bdffec1a
orange = Business("Orange Phone", orangephone)

# ╔═╡ dcf1cd33-9002-4639-b677-e5e9dbec60d8
md"""Because we made the `phone` field of type `Phone`, we can use either `USPhone`s or `BelgianPhone`s, as you can see here."""

# ╔═╡ e748d5dd-9d24-4173-b062-525f03f5cdca
typeof(verizon.phone)

# ╔═╡ 73efba3b-d270-4e19-b1ff-2d5f1a6aa8a5
typeof(orange.phone)

# ╔═╡ f22692ca-11a6-4faf-acf5-4ef7a90747cc
md"""
For persons, we'll record a first and last name.
"""

# ╔═╡ 31fb6db9-3712-45dd-ac84-24c939f69c2f
"Contact card for a person."
struct Person <: Contact
	lastname::AbstractString
	firstname::AbstractString
	phone::Phone
end

# ╔═╡ cde8b8f3-6bf5-4573-9894-07222cfd673f
md"""Believe it or not, Santa Clauss has an actual US phone number.
"""

# ╔═╡ 65c36451-329f-49ff-a29b-881834fc5bd6
santaphone = USPhone("951", "262", "3062")

# ╔═╡ da1f0c8c-328e-477a-9bf7-cd6d40777191
santa = Person("Kris", "Kringle", santaphone)

# ╔═╡ fd4a8bed-7f69-4377-873f-0a165be38851
md"""
In the 10-minute notebook [introducing functions](https://neelsmith.github.io/10MinutesOfJulia/fundamentals/types.html) we'll see how you can make our custom types much more useful by writing functions that work with them.
"""

# ╔═╡ Cell order:
# ╟─1d33a49b-764b-4036-8815-035173a1cb13
# ╟─aacf30aa-5387-11ec-38fd-15f7ed2c15c8
# ╟─0a589e5f-f26d-4a88-a9ce-8806732b7a41
# ╟─9956a170-c1a8-4081-b2a7-ec219831510c
# ╟─b2ed7b59-c360-4da4-847f-b94aed119341
# ╠═4de4b5e0-26d7-46b1-8371-25012858f5e0
# ╟─d6cc4f99-ba2f-4d35-a2d2-dad89251f797
# ╟─3a502c42-5679-4e6f-b5f6-23e9555b0d87
# ╠═9a6f64c0-061a-492e-8aed-71da8e534c5a
# ╟─b1775158-1bf9-42d6-aa20-9aca2ddf85d7
# ╟─64a7830e-3638-42d6-a162-0ca7d5074e5b
# ╠═a4945eff-82c1-413f-95cd-b488b7f43a0e
# ╠═6736740e-6b9a-4aff-91f5-9d98d9b3e938
# ╠═463ee18f-2d90-4466-a77c-4a2fc885d9b4
# ╠═db4bdcc1-3020-40fd-86d1-ad2a9528894e
# ╟─1afe0059-d2d1-410f-a8cd-db86a48bdf03
# ╟─8f44df7e-d954-405e-abf6-b113cd18fcfb
# ╠═67212168-ef3d-44f3-9df5-99cd53fefb78
# ╠═3193f8ca-7159-40e6-a17d-bfd5030f0f16
# ╠═49cba11a-5dc2-42fc-9be7-0a638a9fb735
# ╟─b611b970-af19-4332-aa3b-e4185689e8b0
# ╠═2d4859de-680b-424a-81b7-c7a8db1078fc
# ╟─15d525be-28a3-4e5c-86f1-185e5e13e4f9
# ╟─ffe4836b-be6e-48ca-9da5-42685cfdc4ed
# ╠═5ffb7ba2-52b9-4831-ac30-f0083ce17687
# ╟─645a978d-d0b8-4584-a0a3-53ae97bc3341
# ╠═50be797a-11e8-4f17-a900-cfcdc7731171
# ╠═4b56e1f2-ff76-457e-9d91-2a1747f3f30b
# ╠═81e46944-c980-405c-a0fa-373c9c2bb7f8
# ╟─5a49e37b-5e5b-4de1-b05e-173bcec00d3b
# ╟─8e97804c-bdb2-455f-9542-90620bb75151
# ╠═9fde4cfa-dff5-41d2-bc15-00db9202fc5f
# ╟─ab699e2b-c106-456d-aeae-f150807ab645
# ╠═9bb30356-9025-402b-bc8f-56a16d663983
# ╟─e90c18ed-4831-42a5-880c-c84403b67974
# ╠═e7e09c11-d58a-480b-b91a-6ba049c562b5
# ╠═6269ef53-82c0-4548-95f2-bc03bdffec1a
# ╟─dcf1cd33-9002-4639-b677-e5e9dbec60d8
# ╠═e748d5dd-9d24-4173-b062-525f03f5cdca
# ╠═73efba3b-d270-4e19-b1ff-2d5f1a6aa8a5
# ╟─f22692ca-11a6-4faf-acf5-4ef7a90747cc
# ╠═31fb6db9-3712-45dd-ac84-24c939f69c2f
# ╟─cde8b8f3-6bf5-4573-9894-07222cfd673f
# ╠═65c36451-329f-49ff-a29b-881834fc5bd6
# ╠═da1f0c8c-328e-477a-9bf7-cd6d40777191
# ╟─fd4a8bed-7f69-4377-873f-0a165be38851
