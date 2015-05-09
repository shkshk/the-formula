lib = "../additional.cjsx"

jest.dontMock(lib)
jest.dontMock("classnames")

React = require("react/addons")
AdditionalParams = require(lib)

Input = require("../input.cjsx")
Drawer = require("../drawer.cjsx")
TestUtils = React.addons.TestUtils
onChange = jest.genMockFunction()

describe "AdditionalParams", ->
  describe "#render", ->
    beforeEach ->
      @additionalParams = TestUtils.renderIntoDocument(
        <AdditionalParams onChange={onChange}
          felt_depth="10"
          margin="11"
          padding="22"
          lug="8"
          power="3"
          vertical_power="7" />
      )

    it "renders drawer", ->
      expect(Drawer.mock.calls[0][0]).toEqual(active: false, onChange: @additionalParams.toggleVisibility)

    it "renders felt depth input", ->
      expectedArgs = { name: "felt_depth", title: "Толщина фетра", value: "10", onChange: onChange }
      expect(Input.mock.calls[0][0]).toEqual(expectedArgs)

    it "renders margin input", ->
      expectedArgs = { name: "margin", title: "От края до строчки", value: "11", onChange: onChange }
      expect(Input.mock.calls[1][0]).toEqual(expectedArgs)

    it "renders padding input", ->
      expectedArgs = { name: "padding", title: "От строчки до кожи", value: "22", onChange: onChange }
      expect(Input.mock.calls[2][0]).toEqual(expectedArgs)

    it "renders lug input", ->
      expectedArgs = { name: "lug", title: "«Язычок»", value: "8", onChange: onChange }
      expect(Input.mock.calls[3][0]).toEqual(expectedArgs)

    it "renders power input", ->
      expectedArgs = { name: "power", title: "Постоянная Мощнуши", value: "3", onChange: onChange }
      expect(Input.mock.calls[4][0]).toEqual(expectedArgs)

    it "renders vertical power input", ->
      expectedArgs = { name: "vertical_power", title: "Вертикальная мощность", value: "7", onChange: onChange }
      expect(Input.mock.calls[5][0]).toEqual(expectedArgs)

  describe "#toggleVisibility", ->
    beforeEach ->
      @additionalParams = TestUtils.renderIntoDocument(
        <AdditionalParams onChange={onChange}
          felt_depth="10"
          margin="11"
          padding="22"
          lug="8"
          power="3"
          vertical_power="7" />
      )

    it "toggles additional params visibility", ->
      fieldset = TestUtils.findRenderedDOMComponentWithTag(@additionalParams, "fieldset")
      expect(fieldset.getDOMNode().className).toEqual("additional_params")

      @additionalParams.toggleVisibility()

      expect(fieldset.getDOMNode().className).toEqual("additional_params is-visible")
