### A Pluto.jl notebook ###
# v0.20.21

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    #! format: off
    return quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
    #! format: on
end

# ╔═╡ a1350819-7123-4318-b766-30a61e3f5071
using PlutoUI, HypertextLiteral

# ╔═╡ f25e59c8-7dee-4546-8c39-93e5417e0a31
HiddenDocs(mod, name) = details(
	@htl("Show docstring for <code>$name</code>"), 
	@htl """
	<div class="pluto-docs-binding">
	<span id="$(name)">$(name)</span>
	$(Base.Docs.doc(Base.Docs.Binding(mod, name)))
	</div>
	""")

# ╔═╡ d0b20b05-2fc7-4944-b4f8-486ee63fcd7c
md"""
# Based on search results and public presentations, the primary developer of Pluto.jl is **Fons van der Plas** (@fonsp), often working in collaboration with Mikołaj Bochenski and other community contributors.

![Fons van der Plas](https://avatars.githubusercontent.com/u/6933510?v=4)
"""

# ╔═╡ ece9b080-38fd-47dd-9450-c8d097e7dd3c
md"""
# Basic Input

"""

# ╔═╡ 0de540c1-85b9-446b-b92c-bc667fc9995c
@bind x Slider(5:15)

# ╔═╡ 93bb28f2-0730-4aff-86ca-750c574672b5
x

# ╔═╡ a20c8065-7146-45f6-8a2a-046205e89189
@bind y Slider(20:0.1:30; default=25, show_value=true)

# ╔═╡ 061c8fe6-56d4-46d4-aa38-1ddba08d686b
y

# ╔═╡ 2388ebc8-6f60-493b-b67c-68cb7eaafdce
md"""
**Not just number ranges!
The first argument is range, but it can also be a Vector (not necessarily in increasing order). And the elements can be of any type, not just numbers!**
"""

# ╔═╡ 00458b9d-4dbd-42d5-bc6a-290b323088dd
@bind which_function Slider([sin, cos, sqrt])

# ╔═╡ c058c734-82ec-483c-b141-ee10410b8917
which_function(π)

# ╔═╡ f9254c1a-dd39-4c47-a55c-33b58294c204
md"""
# Scrubbable
Scrubbable makes a number interactive – you can click and drag its value left or right using your mouse or touch screen.
"""

# ╔═╡ 7c99ed73-3b5b-4067-8775-59e0e835ae1c
md"""
_If Alice has $(@bind a Scrubbable(20)) apples, 
and she gives $(@bind b Scrubbable(3)) apples to Bob..._
"""

# ╔═╡ f425e33a-572c-4a5d-8235-aa8e057cef31
md"""
_...then Alice has **$(a - b)** apples left._
"""

# ╔═╡ 03f252a5-c416-4fe3-9da4-d7fb344103d3
HiddenDocs(PlutoUI,:Scrubbable)

# ╔═╡ fe4a53ca-af4a-4e2b-8d66-49fec9f2fa9a
md"""
# NumberField
### A NumberField can be used just like a Slider, it just looks different:

"""

# ╔═╡ 60116e51-bb2e-4c34-a856-263822e3f666
@bind x_different NumberField(0:100, default=20)

# ╔═╡ 9ff640c8-2338-4c6e-a8ab-a63255419845
md"""
You can also use NumberField without a range, and without a default:
"""

# ╔═╡ 6e99e4de-aaca-40e5-81cf-96e459ca0e9b
@bind x_very_different NumberField()

# ╔═╡ ff8ed440-2dc2-47ca-94a1-ec29642bb732
x_very_different

# ╔═╡ 4174689a-0748-44dc-8947-4838640efc39
md"""
# Switch
A Boolean input.


"""

# ╔═╡ 243e349f-2f09-486e-87e6-9fcad48b0c2d
@bind z Switch()

# ╔═╡ 2c62d701-f182-49d6-b818-d2fe1054e62f
md"""
# $z
"""

# ╔═╡ 8bebe588-4d7d-4837-bc6a-e139d3b6fb42
@bind having_fun Switch(default=true)

# ╔═╡ 92121310-a09b-4d0a-b426-f4f6c9e34d71
md"""
# $having_fun
"""

# ╔═╡ 0b28b2dd-6f81-4c10-8944-d10c4802bbb0
md"""
# CheckBox
A Boolean input.

CheckBox is the same as a Switch, but in a different visual style.
"""

# ╔═╡ 9f0039df-2100-4545-9b6e-5b85671337d7
@bind check_me CheckBox()

# ╔═╡ 71092a85-1e07-4959-848a-d86b66f300a1
md"""
# $check_me
"""

# ╔═╡ f6857670-2a05-404c-ad63-c986ebdf05e0
md"""
# TextField

"""

# ╔═╡ e96bef35-70e6-42d1-aa97-a02719c74aa0
@bind s TextField()

# ╔═╡ 771b5312-5aa5-46d8-b8b7-623842350df6
s

# ╔═╡ 1b1025fa-418d-4719-ab71-968498c773d3
@bind sentence TextField(default="Hello World")

# ╔═╡ e0efa26c-05bf-4a76-aebd-646372018766
md"""
# TextArea
"""

# ╔═╡ 8911ea16-a8c8-4afe-82e8-3b01793e6b44
@bind poem TextField((30, 3), "First Line, \nSecond Line\nThird line")

# ╔═╡ 64d528c9-293c-447a-98c1-4138d84a3b7e
md"""
# Select
"""

# ╔═╡ 5f0cd32a-08c4-472e-9d95-4ef9932b859f
@bind vegetable Select(["potato", "carrot"])

# ╔═╡ fbe9beab-d297-424f-b8c6-044a4b8ff291
vegetable

# ╔═╡ d85042ad-7b85-45d7-b5cc-afe1b860b876
@bind favourite_function Select([sin, cos, tan, sqrt])

# ╔═╡ 4f4c48cc-2a30-49ef-8e42-552393877c07
favourite_function(2)

# ╔═╡ 4ba8778e-34b9-430a-a4ff-3e9087280b37
md"""
Instead of an array of values, you can also give an array of pairs, where the first item is the bound value, and the second item is displayed.
"""

# ╔═╡ aa6ad7e6-25c1-4413-a7e9-0df5f69275dc
@bind fruit Select(["apple" => "🍎", "melon" => "🍉"])

# ╔═╡ 04627e4b-d73c-472c-99b5-274cd86e1995
fruit

# ╔═╡ 27afea21-0ad7-44b4-8acc-95578d2456c0
md"""
# MultiSelect
This widget allows the user to select multiple element by holding Ctrl / Cmd while clicking a more items.
"""

# ╔═╡ 8adab029-0d57-44a2-b96a-55ee2b310e31
@bind vegetable_basket MultiSelect(["potato", "carrot", "cabbage"])

# ╔═╡ dc00b242-2855-4585-9965-1cf2fc8daca3
vegetable_basket

# ╔═╡ a06725b6-530c-49ea-b95d-c5d480abbde5
md"""
# MultiCheckBox
This widget allows the user to select multiple elements using checkboxes.
"""

# ╔═╡ 9f6cc493-a6fc-425c-868b-758b821cd5f7
@bind fruit_basket MultiCheckBox(["apple", "blueberry", "mango"])

# ╔═╡ c83ef1bf-8bb3-4444-b0d6-14aea4267cf0
fruit_basket

# ╔═╡ d46e4727-d7c8-465e-adee-c653a8aec19d
md"""
You can use MultiSelect and MultiCheckBox with any vector of objects, not just strings:
"""

# ╔═╡ cef3e70b-08d4-4c72-bc65-52b98d89795b
@bind my_functions MultiCheckBox([sin, cos, tan])

# ╔═╡ 341a2bc5-9793-4756-b3ca-142245dcdbb0
[f(π) for f in my_functions]

# ╔═╡ 5f622912-f35f-4f97-97cf-3cad5575f259
md"""
# CounterButton
"""

# ╔═╡ 984dc101-1c0d-4829-8fe8-dffe5b848698
@bind clicked CounterButton("Hello world")

# ╔═╡ f5f598d8-6181-4b7f-97cb-9ff5829b6b80
clicked

# ╔═╡ 26f7f7cb-db1c-42f6-bbba-2374c0b279e8
md"""
# Button as reactive trigger
In the example above, any cell that references clicked will re-evaluate when you click the button. This means that you can a button as a reactive trigger, by referencing its value in another cell.
"""

# ╔═╡ c61d63b4-b8cc-4fc4-8ba0-903d8ae676aa
md"""
# Button
There is also the widget LabelButton, which returns the button label as reactive value.

LabelButton is currently bound to the alias Button, but in a future release of PlutoUI, Button will be changed to alias CounterButton, since it is more useful.
"""

# ╔═╡ fa57d338-5f18-4b32-ace7-609795cbc777
let
	go
	
	md"I am $(rand(1:15)) years old!"
end

# ╔═╡ c9897466-0e34-413b-a4b7-989d7f77dbcc
begin
	# reference the bound variable - clicking the button will run this cell
	go

	md"My favorite number is $(rand())!"
end

# ╔═╡ 1e14d2d7-e5e8-43d8-91d9-d493696683ea
md"""
# FilePicker

"""

# ╔═╡ 29b73602-65c6-41f8-851a-51b99ca7f81e
@bind important_document FilePicker()

# ╔═╡ 5ad0c8dd-d1c3-4bc2-a6b5-22a0ee34c727
important_document

# ╔═╡ f4296059-95b6-4918-a611-14f0f54f13ee
md"""
The file picker is useful if you want to show off your notebook on a dataset or image uploaded by the reader. It will work anywhere - you don't access files using their path.

The caveat is that large files might take a long time to get processed: everything needs to pass through the browser. If you are using large datasets, a better option is to use Select to let the reader pick a filename. You can then read the file using Base.read(filename, type)
"""

# ╔═╡ 43a0c035-6057-4f7e-8e8c-84c1617d2f13
md"""
# DownloadButton
The download button is not an input element that you can @bind to, it's an output that you can use to get processed data from your notebook easily. The second argument is the output filename.
"""

# ╔═╡ 3b252c9f-52c5-4e76-8334-4522c9502346
DownloadButton(poem, "poem.txt")

# ╔═╡ ea8c5dd4-879a-4d48-ba49-d25ce602f282
DownloadButton([0x01, 0x02, 0x03], "secret_data.bin")

# ╔═╡ 63e35ad9-cc70-45e9-89d5-f901d7761db8
md"""
# Clock


"""

# ╔═╡ c95b35fd-9191-4a69-b7be-e394f76cf48b
@bind t Clock()

# ╔═╡ 0562286d-8c53-4f38-b783-798a694f6f97
t

# ╔═╡ afdb8550-4a63-4ad7-8123-4bc5d1eac3c8
md"""
You can set the interval (5.0 seconds), and disable the UI (true):
"""

# ╔═╡ 6780c8d0-2a01-4822-bd54-faa3cf88ff72
@bind t_slow Clock(5.0, true)

# ╔═╡ 2fda4577-a327-46b3-b089-5cdb8ede1770
t_slow

# ╔═╡ c5be9928-2141-4da1-a3f1-8f091e76b70d
md"""
You can use a Clock to drive an animation! Or use it to repeat the same command at an interval: just like with Button, you can reference a bound (reactive) variable without actually using it!


"""

# ╔═╡ b4092f33-a7fa-471b-9ec4-e7722dda797e
md"""
# Show variable name with @bindname
You can use the macro @bindname instead of @bind to display the variable name before the bond
"""

# ╔═╡ cf575dbb-2b6b-4919-9094-abfbeaf5e5f3
@bindname test2 Slider(1:20)

# ╔═╡ 4f374761-ee7b-4afc-87be-370ce2151ceb
md"""
# Confirm
Normally, when you move a Slider or type in a TextField, all intermediate values are sent back to @bind. By wrapping an input element in confirm, you get a button to manually control when the value is sent, intermediate updates are hidden from Pluto.
"""

# ╔═╡ f19f89ef-4ef6-43de-bfcd-0e776f0cfbcf
@bind distance confirm(Slider(1:100))

# ╔═╡ 013ffa83-4513-4950-8497-56c69d19f0d8
md"""
confirm can be wrapper around any input element to create a new one, including inputs from other packages, or inputs that you have made yourself!
"""

# ╔═╡ ca2f9cad-2afb-4d01-8dcc-85f8ce234a50
md"""
# Combine
This next high-level component is a bit tricky, but very powerful!

Using combine, you can create a single input out of multiple existing ones! In the example below, we create a new input, wind_speed_input. Notice that the list of wind directions is dynamic: if you add a new direction, a 5th slider will appear!
"""

# ╔═╡ 8301f842-4073-4659-9bc3-30fccdf55b4d
import PlutoUI: combine

# ╔═╡ f1b04872-1a23-4270-8e74-58bdc8fe845a
function wind_speed_input(directions::Vector)
	
	return combine() do Child
		
		inputs = [
			md""" $(name): $(
				Child(name, Slider(1:100))
			)"""
			
			for name in directions
		]
		
		md"""
		#### Wind speeds
		$(inputs)
		"""
	end
end

# ╔═╡ 234e97d2-99c9-4932-9bd1-774890c1664f
@bind speeds wind_speed_input(["North", "East", "South", "West"])

# ╔═╡ a93a70df-ac6d-4d47-9a3b-096b6060b54a
speeds

# ╔═╡ fd46b116-a89a-42ea-ab40-78280752c500
md"""
# Loading resources
Notebooks use data from different places. For example, you use Base.read to access local data (files) inside your Julia code, and Downloads.jl for remote data (interwebs).

PlutoUI helps you communicate with the person reading the notebook!

- To get remote media (URL) inside your Markdown text, use PlutoUI.Resource.

- To get local media (file) inside your Markdown text, use PlutoUI.LocalResource.

(With media, we mean images, video and audio.)
"""

# ╔═╡ fe8009f2-2946-49dd-a0ee-c0bb00b97f59
md"""
Resource
If you just want to show images inside Markdown, you can use the built-in syntax (without PlutoUI):

```julia
md"Here is a _dog_: ![](https://fonsp.com/img/doggoSmall.jpg)"
```
PlutoUI.Resource has some extra features:

specify image dimensions and spacing

support for videos

support for audio
"""

# ╔═╡ e489c533-030d-462f-bc3b-02893c1b1db8
dog_url = "https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Welsh_Springer_Spaniel.jpg/640px-Welsh_Springer_Spaniel.jpg"

# ╔═╡ 6da1cad6-b6d4-4dae-ab6b-0ac06644fc5b
md"""Hello I am a dog $(Resource(dog_url))"""

# ╔═╡ 83d487d3-1837-42e4-9f3d-89b8ff4c72a0
t_rex_url = "https://upload.wikimedia.org/wikipedia/commons/transcoded/6/62/Meow.ogg/Meow.ogg.mp3"

# ╔═╡ 2e1a96c1-c6c8-44b5-b08e-6cbd47524f89
md"""And I sound like this: $(Resource(t_rex_url))"""

# ╔═╡ 22cb41ea-992c-4285-9b43-ed356f43ce07
flower_url = "https://upload.wikimedia.org/wikipedia/commons/4/41/Sunflower_Flower_Opening_Time_Lapse.ogv"

# ╔═╡ b82ecc36-dda6-45a1-bec4-c8e23a34f6d7
md"""This is my flower friend

$(Resource(flower_url, :width => 200))"""

# ╔═╡ b038a3dd-3f76-48c7-b4d9-5cb1f83bc2b5
md"""
# Attributes
You can pass additional HTML attributes to Resource, these will be added to the element. For example:
"""

# ╔═╡ 44d07fbb-e037-4ff7-b1a3-841eb535dfd6
md"""
$(Resource(dog_url, :width => 20))
$(Resource(dog_url, :width => 50))
$(Resource(dog_url, :width => 100))
$(Resource(dog_url, 
	:width => 100, 
	:style => "filter: grayscale(100%); border: 3px solid black;"))
"""

# ╔═╡ 6d85e40b-6a3d-444b-9c74-5a5a2d8a7c0d
Resource(flower_url, :width => 200, :autoplay => "", :loop => "")

# ╔═╡ 3c108339-8130-4840-9fbc-e28b5d7d037c
md"### YouTube, Vimeo, etc.

If you use `Resource` for video, the URL has to point to a _video file_ (like `.mp4` or `.mov`). 

Popular video sites don't give you that link, instead, you can use their **embed codes**. You can find these inside the video player, by right clicking or using the menu buttons. You then use that inside an HTML block:
```
html\"\"\"
~ paste embed code here ~
\"\"\"
```

You might need to change the `width` to `100%` to make it fit."

# ╔═╡ a8f2ff3c-bb4d-4eef-96e5-d5d496e7d89e
html"""

<div style="padding:56.25% 0 0 0;position:relative;"><iframe src="https://player.vimeo.com/video/438210156" style="position:absolute;top:0;left:0;width:100%;height:100%;" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe></div><script src="https://player.vimeo.com/api/player.js"></script>

"""

# ╔═╡ 9698eeba-6360-45eb-8195-ea33c84f798d
md"""
# LocalResource (not always recommended)
The examples above use Resource to make media from a URL available inside Markdown. To use local files, simply replace Resource with LocalResource, and use a file path instead of a URL.
"""

# ╔═╡ a43b8b9a-7557-4f27-a8dc-f21087569e0a
md"""Hello I am a dog $(LocalResource("img/logo.jpg"))"""

# ╔═╡ c92c9494-05ad-478a-a8d9-8fcfea8dfbea
md"""
# Reading time
PlutoUI contains a handy widget to display the estimated reading time of the current document.


"""

# ╔═╡ f1f5af0f-9d47-44db-b5e7-6a02e7a0ec66
HiddenDocs(PlutoUI,:ReadingTimeEstimator)

# ╔═╡ 84ee3eec-aecb-4ffd-b224-6dd31505b361
ReadingTimeEstimator()


# ╔═╡ b3ab273f-8f5e-4b27-b36e-188e402b13ed
details(
	"Read a long text",
	md"""
	#### Here is some very long text
	Did you know that Pluto was written in Julia and JavaScript? Pluto is open source, which means that you can read its source code and learn exactly how it works! 
	
	Open source also means that you are invited to contribute to Pluto – you can [report issues](https://github.com/fonsp/Pluto.jl/issues), suggest features, or even [submit your own code changes](https://github.com/fonsp/Pluto.jl/pulls) to help improve it. Whether you’re fixing a small typo or designing a big new feature, every contribution is welcome. By participating, you not only help others, but also learn more about Julia, web technologies, and interactive computing. 🌱
	"""
)

# ╔═╡ 00f47509-cd00-449f-bdc4-6b6af0196ea3
md"""
# WideCell
You can use WideCell from PlutoUI to show something in an extra wide cell. If the screen is big enough, this cell will be extra wide, breaking out of the usual 700px wide margins of the Pluto notebook.

On a narrow screen (like a phone or a small window), the cell will fit to the screen width, like any other cell. This avoids overflow, where content is not visible.
"""

# ╔═╡ 1d3baec2-16ab-4c39-a610-d6d8c519dfca
WideCell(
	md"""
	#### Hello from an extra wide cell! I can fit so so so so so so so so so so so so so so so so much in here!
	Here is a picture:
	
	![image of a sunset](https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Red_Sunset_Panorama_-_Canada1.jpg/2560px-Red_Sunset_Panorama_-_Canada1.jpg)
	"""
)

# ╔═╡ d00b42dd-23b0-422a-b287-75be6e0b8ea1
let
	x = 1:25
	y = 4:13

	M = [
		a*b
		for b in y, a in x
	]

	all_text = repr(MIME"text/plain"(), M)
	Text(all_text)
	
end |> WideCell

# ╔═╡ 08268b5f-3c0b-49f4-bda1-c1292f335ad3
md"""
# ExperimentalLayout.aside
The aside function lets you place content on the right margin of the page. You might need to hide the Table of Contents to see it (top left corner of the ToC). On small screens (when there is no margin), the aside will automatically turn into regular block content.
"""

# ╔═╡ 336d4432-45a5-4896-924c-47cddea5dbfd
content_for_aside = md"""
This information is in the sidebar!

!!! tip
	You can put anything in here, like a picture:

	![image of a sunset](https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Red_Sunset_Panorama_-_Canada1.jpg/2560px-Red_Sunset_Panorama_-_Canada1.jpg)
""";

# ╔═╡ 45d81c0d-a030-4b04-a683-979b7768d07a
PlutoUI.ExperimentalLayout.aside(content_for_aside)

# ╔═╡ 2fa6da89-df06-4f78-a9ae-7cd08bf0c59a
md"""
# NotebookCard
You can use NotebookCard to create an inviting link to another notebook. This is available for notebooks on sites generated using PlutoPages.jl and PlutoSliderServer.jl. The image, title and description are taken from notebook frontmatter. Check out the docstring to learn more!
"""

# ╔═╡ f2d6c8b7-8a46-48e5-a882-3559e2880844
NotebookCard("https://plutojl.org/en/docs/expressionexplorer/")

# ╔═╡ 97d50e6e-3a52-4885-a861-f42ac41c6626
HiddenDocs(PlutoUI,:NotebookCard)

# ╔═╡ fca46d3d-45bd-46d2-8d19-6e2042ab9b99
md"""
# PlutoUI without Pluto
"""

# ╔═╡ e97dc354-894f-4800-ac84-8a0c2eccb691
md"""
Did you know that you can run Pluto notebooks without Pluto? If your notebook is called wow.jl, then

```julia
$ julia wow.jl
```
will run the notebook just fine.

When you use @bind, your notebook can still run without Pluto! Sort of. Normally, all bound variables are assigned the value missing when you run it elsewhere. However, the PlutoUI types have all been configured to assign a more sensible default value.
"""

# ╔═╡ 669ad47e-0386-11f1-b41a-6de9fc94c5d5
md"""
```julia
# Install required packages (run once in Julia REPL)
# using Pkg
# Pkg.add(["DataFrames", "GLM", "Statistics", "Random"])

using DataFrames
using GLM
using Statistics
using Random

# Set random seed for reproducibility
Random.seed!(42)

# -----------------------------
# 1. Generate synthetic dataset
# -----------------------------
n = 100
x = rand(n) .* 10  # Feature values between 0 and 10
y = 3.5 .* x .+ 7 .+ randn(n) .* 2  # y = 3.5x + 7 + noise

# Create DataFrame
df = DataFrame(x = x, y = y)

# -----------------------------
# 2. Fit linear regression model
# -----------------------------
model = lm(@formula(y ~ x), df)

# -----------------------------
# 3. Display results
# -----------------------------
println("Model Summary:")
display(coeftable(model))

# -----------------------------
# 4. Make predictions
# -----------------------------
new_data = DataFrame(x = [2.0, 5.0, 8.0])
predictions = predict(model, new_data)
println("\nPredictions for x = 2, 5, 8:")
println(predictions)

# -----------------------------
# 5. Evaluate model (R²)
# -----------------------------
y_pred = predict(model, df)
ss_total = sum((y .- mean(y)).^2)
ss_res = sum((y .- y_pred).^2)
r2 = 1 - (ss_res / ss_total)
println("\nR² Score: ", round(r2, digits=4))
```
"""

# ╔═╡ 97d32da3-ecbc-4a7a-aee3-8dd876da6ecc
md"""
# Simple Linear Regression Model 
```julia
# Install Flux if not already installed
using Pkg
Pkg.add("Flux")

# Import Flux
using Flux

# -----------------------------
# 1. Generate synthetic data
# -----------------------------
# y = 3x + 2 + noise
x_data = collect(0:0.1:10)                # Input values
y_data = 3 .* x_data .+ 2 .+ 0.5 .* randn(length(x_data))  # Output with noise

# Convert to tensors (Flux works with arrays of Float32)
x_train = reshape(Float32.(x_data), 1, :)
y_train = reshape(Float32.(y_data), 1, :)

# -----------------------------
# 2. Define the model
# -----------------------------
model = Chain(
    Dense(1, 1)  # Single neuron for linear regression
)

# -----------------------------
# 3. Define loss function
# -----------------------------
loss_fn(x, y) = Flux.Losses.mse(model(x), y)

# -----------------------------
# 4. Choose optimizer
# -----------------------------
opt = Descent(0.01)  # Simple gradient descent

# -----------------------------
# 5. Train the model
# -----------------------------
println("Training...")
for epoch in 1:200
    Flux.train!(loss_fn, params(model), [(x_train, y_train)], opt)
    if epoch % 50 == 0
        println("Epoch $epoch - Loss: ", loss_fn(x_train, y_train))
    end
end

# -----------------------------
# 6. Test the model
# -----------------------------
println("\nLearned weight and bias:")
println(model[1].weight, " ", model[1].bias)

# Predict for a new value
x_new = Float32[4.0]
y_pred = model(reshape(x_new, 1, :))
println("Prediction for x=4: ", y_pred[1])

```
"""

# ╔═╡ 7b4c0dd9-4442-407f-bdd1-5a3036292ff2
md"""
# GLM Example

```julia

using GLM
# Sample data
data = DataFrame(
    x = [1200, 1800, 2500, 3000, 3800],
    y = [200000, 300000, 420000, 500000, 650000]
)

# Display the DataFrame
println(data)

# Fit the model
model = lm(@formula(y ~ x), data)

# Print the model summary
println(summary(model))

# Create a DataFrame for new data
new_data = DataFrame(x = [4500])

# Make predictions
predictions = predict(model, new_data)

# Print the predictions
println("Predicted price: ", predictions)

# Create a scatter plot of the data
scatter(data.x, data.y, label="Data")

# Plot the regression line
plot!(data.x, predict(model, data), label="Regression Line")

# Add labels and title
xlabel!("House Size (sq ft)")
ylabel!("House Price")
title!("Linear Regression Model")

# Display the plot
display(plot())

```

"""

# ╔═╡ d9be8065-8057-4ca2-b207-27419db333fd
@bind go Button("Go!")

# ╔═╡ 679d4a0b-0962-4cba-9a66-e25974d4f025
# ╠═╡ disabled = true
#=╠═╡
@bind go CounterButton("Recompute")
  ╠═╡ =#

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
HypertextLiteral = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
HypertextLiteral = "~1.0.0"
PlutoUI = "~0.7.79"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.12.4"
manifest_format = "2.0"
project_hash = "e8c6c4cf34fcf205d5c257e78e8680a642c6e0e6"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "6e1d2a35f2f90a4bc7c2ed98079b2ba09c35b83a"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.3.2"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.2"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"
version = "1.11.0"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"
version = "1.11.0"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "67e11ee83a43eb71ddc950302c53bf33f0690dfe"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.12.1"
weakdeps = ["StyledStrings"]

    [deps.ColorTypes.extensions]
    StyledStringsExt = "StyledStrings"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.3.0+1"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"
version = "1.11.0"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.7.0"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"
version = "1.11.0"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "05882d6995ae5c12bb5f36dd2ed3f61c98cbb172"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.5"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "179267cfa5e712760cd43dcae385d7ea90cc25a4"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.5"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "d1a86724f81bcd184a38fd284ce183ec067d71a0"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "1.0.0"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "0ee181ec08df7d7c911901ea38baf16f755114dc"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "1.0.0"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"
version = "1.11.0"

[[deps.JuliaSyntaxHighlighting]]
deps = ["StyledStrings"]
uuid = "ac6e5ff7-fb65-4e79-a425-ec3bc9c03011"
version = "1.12.0"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.4"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "OpenSSL_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "8.15.0+0"

[[deps.LibGit2]]
deps = ["LibGit2_jll", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"
version = "1.11.0"

[[deps.LibGit2_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "OpenSSL_jll"]
uuid = "e37daf67-58a4-590a-8e99-b0245dd2ffc5"
version = "1.9.0+0"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "OpenSSL_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.11.3+1"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"
version = "1.11.0"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
version = "1.12.0"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"
version = "1.11.0"

[[deps.MIMEs]]
git-tree-sha1 = "c64d943587f7187e751162b3b84445bbbd79f691"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "1.1.0"

[[deps.Markdown]]
deps = ["Base64", "JuliaSyntaxHighlighting", "StyledStrings"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"
version = "1.11.0"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2025.11.4"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.3.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.29+0"

[[deps.OpenSSL_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "3.5.4+0"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "FileWatching", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "Random", "SHA", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.12.1"

    [deps.Pkg.extensions]
    REPLExt = "REPL"

    [deps.Pkg.weakdeps]
    REPL = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "Downloads", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "3ac7038a98ef6977d44adeadc73cc6f596c08109"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.79"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"
version = "1.11.0"

[[deps.Random]]
deps = ["SHA"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"
version = "1.11.0"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"
version = "1.11.0"

[[deps.Statistics]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "ae3bb1eb3bba077cd276bc5cfc337cc65c3075c0"
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
version = "1.11.1"

    [deps.Statistics.extensions]
    SparseArraysExt = ["SparseArrays"]

    [deps.Statistics.weakdeps]
    SparseArrays = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.StyledStrings]]
uuid = "f489334b-da3d-4c2e-b8f0-e476e12c162b"
version = "1.11.0"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.3"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"
version = "1.11.0"

[[deps.Tricks]]
git-tree-sha1 = "311349fd1c93a31f783f977a71e8b062a57d4101"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.13"

[[deps.URIs]]
git-tree-sha1 = "bef26fb046d031353ef97a82e3fdb6afe7f21b1a"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.6.1"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"
version = "1.11.0"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
version = "1.11.0"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.3.1+2"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.15.0+0"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.64.0+1"

[[deps.p7zip_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.7.0+0"
"""

# ╔═╡ Cell order:
# ╠═a1350819-7123-4318-b766-30a61e3f5071
# ╟─f25e59c8-7dee-4546-8c39-93e5417e0a31
# ╟─d0b20b05-2fc7-4944-b4f8-486ee63fcd7c
# ╠═ece9b080-38fd-47dd-9450-c8d097e7dd3c
# ╠═0de540c1-85b9-446b-b92c-bc667fc9995c
# ╠═93bb28f2-0730-4aff-86ca-750c574672b5
# ╠═a20c8065-7146-45f6-8a2a-046205e89189
# ╠═061c8fe6-56d4-46d4-aa38-1ddba08d686b
# ╠═2388ebc8-6f60-493b-b67c-68cb7eaafdce
# ╠═00458b9d-4dbd-42d5-bc6a-290b323088dd
# ╠═c058c734-82ec-483c-b141-ee10410b8917
# ╟─f9254c1a-dd39-4c47-a55c-33b58294c204
# ╠═7c99ed73-3b5b-4067-8775-59e0e835ae1c
# ╠═f425e33a-572c-4a5d-8235-aa8e057cef31
# ╟─03f252a5-c416-4fe3-9da4-d7fb344103d3
# ╟─fe4a53ca-af4a-4e2b-8d66-49fec9f2fa9a
# ╠═60116e51-bb2e-4c34-a856-263822e3f666
# ╠═9ff640c8-2338-4c6e-a8ab-a63255419845
# ╠═6e99e4de-aaca-40e5-81cf-96e459ca0e9b
# ╠═ff8ed440-2dc2-47ca-94a1-ec29642bb732
# ╠═4174689a-0748-44dc-8947-4838640efc39
# ╠═243e349f-2f09-486e-87e6-9fcad48b0c2d
# ╠═2c62d701-f182-49d6-b818-d2fe1054e62f
# ╠═8bebe588-4d7d-4837-bc6a-e139d3b6fb42
# ╠═92121310-a09b-4d0a-b426-f4f6c9e34d71
# ╟─0b28b2dd-6f81-4c10-8944-d10c4802bbb0
# ╠═9f0039df-2100-4545-9b6e-5b85671337d7
# ╠═71092a85-1e07-4959-848a-d86b66f300a1
# ╠═f6857670-2a05-404c-ad63-c986ebdf05e0
# ╠═e96bef35-70e6-42d1-aa97-a02719c74aa0
# ╠═771b5312-5aa5-46d8-b8b7-623842350df6
# ╠═1b1025fa-418d-4719-ab71-968498c773d3
# ╟─e0efa26c-05bf-4a76-aebd-646372018766
# ╠═8911ea16-a8c8-4afe-82e8-3b01793e6b44
# ╟─64d528c9-293c-447a-98c1-4138d84a3b7e
# ╠═5f0cd32a-08c4-472e-9d95-4ef9932b859f
# ╠═fbe9beab-d297-424f-b8c6-044a4b8ff291
# ╠═d85042ad-7b85-45d7-b5cc-afe1b860b876
# ╠═4f4c48cc-2a30-49ef-8e42-552393877c07
# ╟─4ba8778e-34b9-430a-a4ff-3e9087280b37
# ╠═aa6ad7e6-25c1-4413-a7e9-0df5f69275dc
# ╠═04627e4b-d73c-472c-99b5-274cd86e1995
# ╠═27afea21-0ad7-44b4-8acc-95578d2456c0
# ╠═8adab029-0d57-44a2-b96a-55ee2b310e31
# ╠═dc00b242-2855-4585-9965-1cf2fc8daca3
# ╟─a06725b6-530c-49ea-b95d-c5d480abbde5
# ╠═9f6cc493-a6fc-425c-868b-758b821cd5f7
# ╠═c83ef1bf-8bb3-4444-b0d6-14aea4267cf0
# ╟─d46e4727-d7c8-465e-adee-c653a8aec19d
# ╠═cef3e70b-08d4-4c72-bc65-52b98d89795b
# ╠═341a2bc5-9793-4756-b3ca-142245dcdbb0
# ╟─5f622912-f35f-4f97-97cf-3cad5575f259
# ╠═984dc101-1c0d-4829-8fe8-dffe5b848698
# ╠═f5f598d8-6181-4b7f-97cb-9ff5829b6b80
# ╟─26f7f7cb-db1c-42f6-bbba-2374c0b279e8
# ╠═679d4a0b-0962-4cba-9a66-e25974d4f025
# ╠═fa57d338-5f18-4b32-ace7-609795cbc777
# ╟─c61d63b4-b8cc-4fc4-8ba0-903d8ae676aa
# ╠═d9be8065-8057-4ca2-b207-27419db333fd
# ╠═c9897466-0e34-413b-a4b7-989d7f77dbcc
# ╠═1e14d2d7-e5e8-43d8-91d9-d493696683ea
# ╠═29b73602-65c6-41f8-851a-51b99ca7f81e
# ╠═5ad0c8dd-d1c3-4bc2-a6b5-22a0ee34c727
# ╟─f4296059-95b6-4918-a611-14f0f54f13ee
# ╟─43a0c035-6057-4f7e-8e8c-84c1617d2f13
# ╠═3b252c9f-52c5-4e76-8334-4522c9502346
# ╠═ea8c5dd4-879a-4d48-ba49-d25ce602f282
# ╟─63e35ad9-cc70-45e9-89d5-f901d7761db8
# ╠═c95b35fd-9191-4a69-b7be-e394f76cf48b
# ╠═0562286d-8c53-4f38-b783-798a694f6f97
# ╟─afdb8550-4a63-4ad7-8123-4bc5d1eac3c8
# ╠═6780c8d0-2a01-4822-bd54-faa3cf88ff72
# ╠═2fda4577-a327-46b3-b089-5cdb8ede1770
# ╟─c5be9928-2141-4da1-a3f1-8f091e76b70d
# ╟─b4092f33-a7fa-471b-9ec4-e7722dda797e
# ╠═cf575dbb-2b6b-4919-9094-abfbeaf5e5f3
# ╟─4f374761-ee7b-4afc-87be-370ce2151ceb
# ╠═f19f89ef-4ef6-43de-bfcd-0e776f0cfbcf
# ╟─013ffa83-4513-4950-8497-56c69d19f0d8
# ╟─ca2f9cad-2afb-4d01-8dcc-85f8ce234a50
# ╠═8301f842-4073-4659-9bc3-30fccdf55b4d
# ╠═234e97d2-99c9-4932-9bd1-774890c1664f
# ╠═a93a70df-ac6d-4d47-9a3b-096b6060b54a
# ╠═f1b04872-1a23-4270-8e74-58bdc8fe845a
# ╟─fd46b116-a89a-42ea-ab40-78280752c500
# ╟─fe8009f2-2946-49dd-a0ee-c0bb00b97f59
# ╟─e489c533-030d-462f-bc3b-02893c1b1db8
# ╠═6da1cad6-b6d4-4dae-ab6b-0ac06644fc5b
# ╠═83d487d3-1837-42e4-9f3d-89b8ff4c72a0
# ╠═2e1a96c1-c6c8-44b5-b08e-6cbd47524f89
# ╠═22cb41ea-992c-4285-9b43-ed356f43ce07
# ╠═b82ecc36-dda6-45a1-bec4-c8e23a34f6d7
# ╟─b038a3dd-3f76-48c7-b4d9-5cb1f83bc2b5
# ╠═44d07fbb-e037-4ff7-b1a3-841eb535dfd6
# ╠═6d85e40b-6a3d-444b-9c74-5a5a2d8a7c0d
# ╠═3c108339-8130-4840-9fbc-e28b5d7d037c
# ╠═a8f2ff3c-bb4d-4eef-96e5-d5d496e7d89e
# ╟─9698eeba-6360-45eb-8195-ea33c84f798d
# ╠═a43b8b9a-7557-4f27-a8dc-f21087569e0a
# ╟─c92c9494-05ad-478a-a8d9-8fcfea8dfbea
# ╠═f1f5af0f-9d47-44db-b5e7-6a02e7a0ec66
# ╠═84ee3eec-aecb-4ffd-b224-6dd31505b361
# ╠═b3ab273f-8f5e-4b27-b36e-188e402b13ed
# ╟─00f47509-cd00-449f-bdc4-6b6af0196ea3
# ╠═1d3baec2-16ab-4c39-a610-d6d8c519dfca
# ╠═d00b42dd-23b0-422a-b287-75be6e0b8ea1
# ╟─08268b5f-3c0b-49f4-bda1-c1292f335ad3
# ╠═45d81c0d-a030-4b04-a683-979b7768d07a
# ╠═336d4432-45a5-4896-924c-47cddea5dbfd
# ╟─2fa6da89-df06-4f78-a9ae-7cd08bf0c59a
# ╠═f2d6c8b7-8a46-48e5-a882-3559e2880844
# ╟─97d50e6e-3a52-4885-a861-f42ac41c6626
# ╟─fca46d3d-45bd-46d2-8d19-6e2042ab9b99
# ╟─e97dc354-894f-4800-ac84-8a0c2eccb691
# ╟─669ad47e-0386-11f1-b41a-6de9fc94c5d5
# ╟─97d32da3-ecbc-4a7a-aee3-8dd876da6ecc
# ╟─7b4c0dd9-4442-407f-bdd1-5a3036292ff2
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
