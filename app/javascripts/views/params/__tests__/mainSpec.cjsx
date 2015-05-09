lib = "../main"

jest.dontMock(lib)
React = require("react/addons")
Params = require(lib)
Input = require("../input")
TestUtils = React.addons.TestUtils
onChange = jest.genMockFunction()

describe "Params", ->
  describe "#render", ->
    beforeEach ->
      @params = TestUtils.renderIntoDocument(
        <Params width="100" height="200" depth="10" onChange={onChange} />
      )

    it "renders width input", ->
      expectedArgs = { name: "width", onChange: onChange, title: "Ширина", value: "100" }
      expect(Input.mock.calls[0][0]).toEqual(expectedArgs)

    it "renders height input", ->
      expectedArgs = { name: "height", onChange: onChange, title: "Высота", value: "200" }
      expect(Input.mock.calls[1][0]).toEqual(expectedArgs)

    it "renders depth input", ->
      expectedArgs = { name: "depth", onChange: onChange, title: "Толщина", value: "10" }
      expect(Input.mock.calls[2][0]).toEqual(expectedArgs)
