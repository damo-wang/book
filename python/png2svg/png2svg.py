import aspose.words as aw

doc=aw.Document()
builder=aw.DocumentBuilder(doc)

shape=builder.insert_image("Input.png")
shape.image_data.save("Output.svg")
