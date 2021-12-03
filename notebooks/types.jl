### A Pluto.jl notebook ###
# v0.17.1

using Markdown
using InteractiveUtils

# ╔═╡ 7deebfca-c352-488c-a9fa-3c40e583126c
md"""

- *Notebook version*: **1.0.0**
- *Prerequisites*:  none
"""

# ╔═╡ 33b1d6be-5371-11ec-306b-9360e2f906ec
md"# Objects, variables and types"

# ╔═╡ 9abeaae6-60f5-4fc4-88f8-83b8ec4e57ee
md"""

> ☞ *Objects* are the nouns of the Julia language;  *functions* are the its verbs. (We'll introduce *functions* in [this 10-minute notebook](https://neelsmith.github.io/10MinutesOfJulia/fundamentals/functions.html).)

You can create an object by simply entering its value (e.g., typing it into a Julia REPL, or entering it in the cell of a Pluto notebook.) 

When you enter an object in a Pluto notebook cell, Pluto displays its value immediately above it.  Let's look at a couple of examples.

"""

# ╔═╡ ac684d89-0cc8-42c0-a3cd-b8132b287ae3
"Four score and seven years ago"

# ╔═╡ 00117930-d7b2-416b-8fdd-86681c37a75c
87

# ╔═╡ 4e08346b-4696-4c60-acc5-94294fea1a33
md"""
> ☞  Every object has a *type*.  You can use the `typeof` function to find out what type  an object belongs to.
"""

# ╔═╡ 908f72a3-15e2-42c0-806a-8ad213d0e6ee
typeof("Four score and seven years ago")

# ╔═╡ 616ed394-4776-447f-bfe0-36138482c258
typeof("87")

# ╔═╡ cc8f4f4b-33f9-457d-bd0c-f712c7a6045c
typeof(87)

# ╔═╡ f926c28b-6f11-400d-b7c9-6c03375d6ad6
typeof(87.5)

# ╔═╡ 027442f9-7fc3-453b-ad7d-a4660a529eac
md"""
Notice that when we entered a series of characters between quotation marks, Julia created an object of type `String`; when we entered digits, it created an `Int64`. When we entered digits with a decimal component, it created a `Float64`.  
"""

# ╔═╡ c4c6ed6b-3e8a-41e6-bf6e-12e264bfdc08
md"""

> ☞ *Variables* are names of objects.  You can create a variable using the *assignment operator*, `=`.
"""

# ╔═╡ 8164a905-e753-4f26-9724-dd30f88dba34
phrase = "Four score and seven years ago"

# ╔═╡ f2207a95-586b-4cfa-85c4-c184160e530d
md"""
Now you can use the variable `phrase` (the left side of the assignment) to refer to the `String` object you created between quotation marks (the right side of the assignment).  Read this in English as, "The variable `phrase` is assigned the value \"Four score and seven years ago\"".

"""

# ╔═╡ c79ca2ea-a7b4-4e85-80d9-cdf38657b642
phrase

# ╔═╡ a9fd2bdf-7415-41af-830e-a6d56a33fbff
typeof(phrase)

# ╔═╡ c655414f-b8a0-46e9-931c-ec0f9c907a63
md"""## Why do we need types? 

Julia looks at the type of an object to determine what functions you can use it with.  Consider an analogy with English.  You could refer to different types of object with the phrase "this number";  the type of the object would determine what verbs it makes sense with.

If "this number" is your cell phone, you could use it with the verb *call*:  "Call **this number**".  If "this number" is the number of earned runs a pitcher allowed in a season, you could use it with the verb *divide* : "To compute the pitcher's earned run average (ERA), divide **this number** by the number of nine-inning units pitched".
"""

# ╔═╡ a0ecd5b8-8f3e-47e5-ae89-38290aade176
md"""### Two brief examples"""

# ╔═╡ 1f51ee7b-4e33-48c5-8bf3-d18257e3276a
md"""#### Innings pitched

Here's a brief illustration using `/`, the Julia function meaning "divide".

In 2000, Pedro Martinez pitched 217 innings.  Divide that by nine to find the number of "nine-inning units" he pitched.
"""

# ╔═╡ 6e6c76ff-088c-4b4d-90f6-30644b07a079
nineinning_units = 217 / 9 

# ╔═╡ f51794ac-65cf-47a9-9983-e3ac8b6b507b
typeof(nineinning_units)

# ╔═╡ cc9bf257-f76a-4da9-bf64-c73562551ee5
md"""He gave up 42 earned runs that year, so if we divide 42 by the number of nine-inning units, we get his ERA.
"""

# ╔═╡ 90e24eca-7e24-4604-b68b-c42720dd1a88
one_kind_of_number = 42

# ╔═╡ 994d4522-2d94-467f-9680-c992f73c54ca
typeof(one_kind_of_number)

# ╔═╡ 5cb213da-ce99-490f-8fcf-71353a34d688
md"""It's OK to use the function  `/` with an `Int64` or with a `Float64` object.  (The verb *divide* makes sense with these kinds of number.)
"""

# ╔═╡ f0243c29-07ba-486f-ade2-e9abc75aab8e
ERA = one_kind_of_number / nineinning_units

# ╔═╡ d13e0b79-a9ef-4552-868d-43a10f78cc08
md"Pedro Martinez' ERA for 2000 was an astonishing 1.74."


# ╔═╡ 7b6b59d9-f375-484d-adb1-a658a6645396
md"""#### Cell-phone numbers

We might represent a 10-digit cell-phone number like this:

"""

# ╔═╡ c68cb644-29bb-4b98-b955-d6a0e3533681
another_number = "123-456-7890"

# ╔═╡ 815ce3e4-fdad-429c-946d-b59db1cb86dc
typeof(another_number)

# ╔═╡ 51eabc56-897f-4ba8-baad-95e7e67e5822
md"""We can't use `/` with a `String` object.  If we try, this is what happens!

(Translating the following error message into English, we could read it to say "We can't use the function `/` with a `String` object and a `Float64` object.")
"""

# ╔═╡ 8d83f8bc-5727-4ccc-9494-cdc7bd5580a1
another_number / nineinning_units

# ╔═╡ d52f0d5a-ec61-4dae-b8f1-cb9ffd41d49b
md"""> (In this 10-minute noteobook on [custom types](https://neelsmith.github.io/10MinutesOfJulia/fundamentals/customtypes.html), we'll look at how you could create your own type for a cell phone number.)
"""

# ╔═╡ 8f37eb01-183e-49f4-9c09-f602242ad97a
md"""## Inheritance

> ☞ Julia's types are related to each other in a hierarchy.  We call the "parent" of a type its *supertype*; "descendants" of a type are called *subtypes*.


The `Int64` and `Float64` types, for example, are both *subtypes* of an abstract `Number` type.  Julia also has multiple types for working with sequences of characters:  the `String` type we saw above is a *subtype* of an `AbstractString` type.


"""

# ╔═╡ 676356ef-c436-41b9-8939-76392d4df94a
md"""
This explains why we were able to use the division function `/` with both `Int64` and `Float64` types:  Julia's `/` function is designed to work with *any* subtype of `Number`.  (The same is true for many functions working with strings of characters:  we'll look at several in this 10-minute notebook introducing [strings](https://neelsmith.github.io/10MinutesOfJulia/fundamentals/strings.html).)
"""

# ╔═╡ e78f9fb2-b2e5-4e66-b731-a86ef3d3e17a
md"""You've already seen that the `typeof` function can tell you what class an object belongs to.  Two julia functions can help you understand where this fits into the hierarchy of classes. 

1. `supertype` tells you the immediate "parent" (*supertype*) of a type
2. `<:` tells you if one type is a "descendant" (*subtype*) of another

"""

# ╔═╡ dd179ea5-c398-451f-a1fd-ad4778cd4d24
md"""### `supertype`
We saw earlier that our `phrase` object belonged to the `String` type. What is it's supertype?"""

# ╔═╡ 5b0c8b77-531d-407d-b1c5-607482a4b04b
supertype(String)

# ╔═╡ e6a8b594-b78d-4fa7-9a8b-465be532671b
md"""The supertype of `AbstractString` is `Any` -- this is the root of the entire Julia type hierarchy.  (Another way of saying this is that every Julia type is a subtype of `Any`.)

"""

# ╔═╡ 8c2cd953-d912-4eaa-bc06-6703f91e78df
supertype(AbstractString)

# ╔═╡ f203796c-00d5-46ed-9f0b-b80b2ba0853a
md"""### `<:`

Let's look at the same relation from the other side.  Is `String` a subtype of `AbstractString`?

"""

# ╔═╡ c571f9d5-5c55-4785-851c-b82a891dcde9
String <: AbstractString

# ╔═╡ 29633786-ee03-46ee-8740-871eed2a5a43
md""">  ⚠️ Note this difference between `supertype` and `<:`
>
> - `supertype` reports the single, immediate supertype of a type
> - `<:` is true for parent-, grandparent- or *any* ancestor-type of a given type.

Compare the following examples.
"""

# ╔═╡ 6fccc2c3-4100-4cbd-91f0-ff1743772b94
supertype(Int64)

# ╔═╡ b17b6a3e-a3a2-4ac3-8aa7-b17b84642b94
Int64 <: Signed

# ╔═╡ c71e7f31-7a09-473d-b4ed-bb31aabffc2a
supertype(Signed)

# ╔═╡ 7b331047-4b7f-44ed-aef4-f1df8e51cd62
Signed <: Integer

# ╔═╡ 22b35f79-c39d-469d-8272-05a391c5df82
Int64 <: Integer

# ╔═╡ 20a2aef1-ad77-4e87-91da-5853d19996af
Int64 <: Number

# ╔═╡ 8000f13b-d206-4ce7-b297-c6002e838b87
md"""## Two other types

"""

# ╔═╡ 5d768422-ad89-4a0b-bd2d-b4d80fc6bf62
md"""In addition to numeric types and string types, you should be aware of two other fundamental (or *primitive*) types.


#### `Bool`

> ☞ The `Bool` type has one of only two possible values:  `true` or `false`. 


(`Bool` is short for Boolean, named in honor of the British logician [George Boole](https://en.wikipedia.org/wiki/George_Boole).)  Many functions create Boolean values, and we will use them often in later notebooks to organize the logic of our code.
"""

# ╔═╡ c3000709-50a1-49ec-bceb-ddd015263d9a
checkhierarchy = String <: AbstractString

# ╔═╡ cd46c276-ac42-4314-8300-8e92525a2179
md"""
You can tell from the way Julia displays this value that `true` is *not* a quoted `String` object.  What type is it?
"""

# ╔═╡ 60592bd9-dc21-4680-80ca-dea3c6335286
typeof(checkhierarchy)

# ╔═╡ 67250bf2-c7f6-401e-b2f1-b903ca85a6bf
md"""#### `Char`

> ☞ Enter a value between single quotes to create an object of type `Char`.

Julia has a type for an individual character in the Unicode character set (more than 100,000 characters!).
"""

# ╔═╡ bf5bf7a2-7e1a-4c93-9629-70a0eb7c2d7a
a = 'A'

# ╔═╡ d4f31499-155a-4b2b-878c-6989f5baadf6
typeof(a)

# ╔═╡ 3f2c69bb-0cad-4f7c-9c15-2b8e01c0bd66
alpha = 'Α'

# ╔═╡ 264b984b-6d3f-4f36-a45f-ace05f821202
md"""Some characters may *look* similar.   As part of its default display, Julia shows you the numeric value (in base 16) for the charater:  `U+0041` is *not* the same as `U+0391`.

"""

# ╔═╡ 9b60b0fa-08cf-42cd-9913-fb5d21a73ac5
md"""One function you can use with `Char`-type objects is `lowercase`.  In this case, we'll be able to see visually that one character belongs to the Roman alphabet, and another to the Greek alphabet.
"""

# ╔═╡ b00b57fa-4c0b-4378-acbd-b8a7ac58cc07
lowercase(alpha)

# ╔═╡ fbd79ed8-51eb-474b-9b67-26a82795792c
lowercase(a)

# ╔═╡ 83b540d5-05a9-4ac3-b8f0-cb467d0d6246
md"""
> ⚠️ Notice the difference between `"a"` and `'a'`.
"""

# ╔═╡ f7f907b7-c102-4208-98d8-1c8e1445957d
typeof("a")

# ╔═╡ 5751e105-2bbb-4b66-9048-a0dd173f386b
typeof('a')

# ╔═╡ 57373d5d-cd9c-47d1-bc5b-fb1994ed1bfa
md"""Some letters may not be easy to type on your keyboard.  The following cell is the character for the first letter in the ancient Lycian alphabet (an Anatolian language used in southwest Asia Minor in the first millenium BCE).
"""

# ╔═╡ 63142e37-1bcd-4b6a-b07f-6044af2d1813
'𐊀'

# ╔═╡ 0159999d-b924-4457-992d-b67a9dc074da
md"""You can also create a `Char` object from its numeric value preceded by `U` (unlike the default display, there is no `+` sign). 
"""

# ╔═╡ 69e10312-c8da-4106-830f-e1a84aa24e78
'\U10280'

# ╔═╡ 1ebda7c8-a236-4359-8320-cb7f58855e75
md"""The result is the same as entering the character directly from your keyboard."""

# ╔═╡ 1f8b09b9-816a-4ecc-8d5d-326f506cc7ac
'\U10280' == '𐊀'

# ╔═╡ 8fb2f5d8-f910-48cc-92d6-935682a2af48
md"""It may seem counterintuitive, but `Char`s are not subtypes of `String`s.  (In [this notebook](https://neelsmith.github.io/10MinutesOfJulia/fundamentals/strings.html), we'll learn more about the relation of `Char`s and `String`s.)

"""

# ╔═╡ 3bf027b1-9a90-4f28-8a3d-d9b124b3e1a3
Char <: String

# ╔═╡ Cell order:
# ╟─7deebfca-c352-488c-a9fa-3c40e583126c
# ╟─33b1d6be-5371-11ec-306b-9360e2f906ec
# ╟─9abeaae6-60f5-4fc4-88f8-83b8ec4e57ee
# ╠═ac684d89-0cc8-42c0-a3cd-b8132b287ae3
# ╠═00117930-d7b2-416b-8fdd-86681c37a75c
# ╟─4e08346b-4696-4c60-acc5-94294fea1a33
# ╠═908f72a3-15e2-42c0-806a-8ad213d0e6ee
# ╠═616ed394-4776-447f-bfe0-36138482c258
# ╠═cc8f4f4b-33f9-457d-bd0c-f712c7a6045c
# ╠═f926c28b-6f11-400d-b7c9-6c03375d6ad6
# ╟─027442f9-7fc3-453b-ad7d-a4660a529eac
# ╟─c4c6ed6b-3e8a-41e6-bf6e-12e264bfdc08
# ╠═8164a905-e753-4f26-9724-dd30f88dba34
# ╟─f2207a95-586b-4cfa-85c4-c184160e530d
# ╠═c79ca2ea-a7b4-4e85-80d9-cdf38657b642
# ╠═a9fd2bdf-7415-41af-830e-a6d56a33fbff
# ╟─c655414f-b8a0-46e9-931c-ec0f9c907a63
# ╟─a0ecd5b8-8f3e-47e5-ae89-38290aade176
# ╟─1f51ee7b-4e33-48c5-8bf3-d18257e3276a
# ╠═6e6c76ff-088c-4b4d-90f6-30644b07a079
# ╠═f51794ac-65cf-47a9-9983-e3ac8b6b507b
# ╟─cc9bf257-f76a-4da9-bf64-c73562551ee5
# ╠═90e24eca-7e24-4604-b68b-c42720dd1a88
# ╠═994d4522-2d94-467f-9680-c992f73c54ca
# ╟─5cb213da-ce99-490f-8fcf-71353a34d688
# ╠═f0243c29-07ba-486f-ade2-e9abc75aab8e
# ╟─d13e0b79-a9ef-4552-868d-43a10f78cc08
# ╟─7b6b59d9-f375-484d-adb1-a658a6645396
# ╠═c68cb644-29bb-4b98-b955-d6a0e3533681
# ╠═815ce3e4-fdad-429c-946d-b59db1cb86dc
# ╟─51eabc56-897f-4ba8-baad-95e7e67e5822
# ╠═8d83f8bc-5727-4ccc-9494-cdc7bd5580a1
# ╟─d52f0d5a-ec61-4dae-b8f1-cb9ffd41d49b
# ╟─8f37eb01-183e-49f4-9c09-f602242ad97a
# ╟─676356ef-c436-41b9-8939-76392d4df94a
# ╟─e78f9fb2-b2e5-4e66-b731-a86ef3d3e17a
# ╟─dd179ea5-c398-451f-a1fd-ad4778cd4d24
# ╠═5b0c8b77-531d-407d-b1c5-607482a4b04b
# ╟─e6a8b594-b78d-4fa7-9a8b-465be532671b
# ╠═8c2cd953-d912-4eaa-bc06-6703f91e78df
# ╟─f203796c-00d5-46ed-9f0b-b80b2ba0853a
# ╠═c571f9d5-5c55-4785-851c-b82a891dcde9
# ╟─29633786-ee03-46ee-8740-871eed2a5a43
# ╠═6fccc2c3-4100-4cbd-91f0-ff1743772b94
# ╠═b17b6a3e-a3a2-4ac3-8aa7-b17b84642b94
# ╠═c71e7f31-7a09-473d-b4ed-bb31aabffc2a
# ╠═7b331047-4b7f-44ed-aef4-f1df8e51cd62
# ╠═22b35f79-c39d-469d-8272-05a391c5df82
# ╠═20a2aef1-ad77-4e87-91da-5853d19996af
# ╟─8000f13b-d206-4ce7-b297-c6002e838b87
# ╟─5d768422-ad89-4a0b-bd2d-b4d80fc6bf62
# ╠═c3000709-50a1-49ec-bceb-ddd015263d9a
# ╟─cd46c276-ac42-4314-8300-8e92525a2179
# ╠═60592bd9-dc21-4680-80ca-dea3c6335286
# ╟─67250bf2-c7f6-401e-b2f1-b903ca85a6bf
# ╠═bf5bf7a2-7e1a-4c93-9629-70a0eb7c2d7a
# ╠═d4f31499-155a-4b2b-878c-6989f5baadf6
# ╠═3f2c69bb-0cad-4f7c-9c15-2b8e01c0bd66
# ╟─264b984b-6d3f-4f36-a45f-ace05f821202
# ╟─9b60b0fa-08cf-42cd-9913-fb5d21a73ac5
# ╠═b00b57fa-4c0b-4378-acbd-b8a7ac58cc07
# ╠═fbd79ed8-51eb-474b-9b67-26a82795792c
# ╟─83b540d5-05a9-4ac3-b8f0-cb467d0d6246
# ╠═f7f907b7-c102-4208-98d8-1c8e1445957d
# ╠═5751e105-2bbb-4b66-9048-a0dd173f386b
# ╟─57373d5d-cd9c-47d1-bc5b-fb1994ed1bfa
# ╠═63142e37-1bcd-4b6a-b07f-6044af2d1813
# ╟─0159999d-b924-4457-992d-b67a9dc074da
# ╠═69e10312-c8da-4106-830f-e1a84aa24e78
# ╟─1ebda7c8-a236-4359-8320-cb7f58855e75
# ╠═1f8b09b9-816a-4ecc-8d5d-326f506cc7ac
# ╟─8fb2f5d8-f910-48cc-92d6-935682a2af48
# ╠═3bf027b1-9a90-4f28-8a3d-d9b124b3e1a3
