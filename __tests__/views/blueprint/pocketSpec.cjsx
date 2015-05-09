lib = "../../../app/javascripts/views/blueprint/pocket.cjsx"

jest.dontMock(lib)
React = require("react/addons")
Pocket = require(lib)
TestUtils = React.addons.TestUtils

describe "Pocket", ->
  describe "#render", ->
    beforeEach ->
      @pocket = TestUtils.renderIntoDocument(<Pocket width=80 height=30 left=10 bottom=35 />)
      @pattern = TestUtils.findRenderedDOMComponentWithClass(@pocket, "blueprint-leather_pocket").getDOMNode()
      @expectedAngle = (Math.asin(30 / 50) / Math.PI) * 180

    it "renders pocket", ->
      expect(@pattern.style.width).toEqual("80mm")
      expect(@pattern.style.height).toEqual("30mm")
      expect(@pattern.style.left).toEqual("10mm")
      expect(@pattern.style.bottom).toEqual("5mm")

    it "renders bottom left pocket border", ->
      borderLeft = TestUtils.findRenderedDOMComponentWithClass(@pocket, "pocket-border--left")
        .getDOMNode()

      expect(borderLeft.style.bottom).toEqual("30mm")
      expect(borderLeft.style.width).toEqual("50mm")
      expect(borderLeft.style.transform).toEqual("rotate(#{@expectedAngle}deg)")

    it "renders bottom right pocket border", ->
      borderRight = TestUtils.findRenderedDOMComponentWithClass(@pocket, "pocket-border--right")
        .getDOMNode()

      expect(borderRight.style.bottom).toEqual("30mm")
      expect(borderRight.style.width).toEqual("50mm")
      expect(borderRight.style.transform).toEqual("rotate(-#{@expectedAngle}deg)")
