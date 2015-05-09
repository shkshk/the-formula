lib = "../felt.cjsx"

jest.dontMock(lib)
React = require("react/addons")
Felt = require(lib)
TestUtils = React.addons.TestUtils

describe "Felt", ->
  describe "#render", ->
    beforeEach ->
      @felt = TestUtils.renderIntoDocument(<Felt width="50" height="100" />)
      @pattern = TestUtils.findRenderedDOMComponentWithTag(@felt, "div").getDOMNode()

    it "renders felt pattern", ->
      expect(@pattern.className).toEqual("blueprint-felt")
      expect(@pattern.style.width).toEqual("50mm")
      expect(@pattern.style.height).toEqual("100mm")

    it "renders felt pattern params", ->
      expect(@pattern.getAttribute("data-width")).toEqual("50")
      expect(@pattern.getAttribute("data-height")).toEqual("100")
