lib = "../leather"

jest.dontMock(lib)
React = require("react/addons")
Leather = require(lib)
TestUtils = React.addons.TestUtils

describe "Leather", ->
  describe "#render", ->
    beforeEach ->
      @leather = TestUtils.renderIntoDocument(<Leather
        width=100
        height=50
        visibleHeight=40
        smallHeight=43
        left=10
        bottom=20 />
      )
      @pattern = TestUtils.findRenderedDOMComponentWithClass(@leather, "blueprint-leather").getDOMNode()

    it "renders leather pattern", ->
      expect(@pattern.style.width).toEqual("100mm")
      expect(@pattern.style.height).toEqual("43mm")
      expect(@pattern.style.left).toEqual("10mm")
      expect(@pattern.style.bottom).toEqual("20mm")

    it "renders leather pattern params", ->
      expect(@pattern.getAttribute("data-width")).toEqual("100")
      expect(@pattern.getAttribute("data-height")).toEqual("40 (50)")
