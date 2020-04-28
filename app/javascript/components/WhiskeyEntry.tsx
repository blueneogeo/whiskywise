import React from "react";
import template from './WhiskeyEntry.pug';
import { boundMethod } from 'autobind-decorator'
import { Whiskey } from "../src/model";

interface Props {
  whiskey: Whiskey

  onClick?: (whiskey: Whiskey) => void
  onDelete?: (whiskey: Whiskey) => void
}

export default class WhiskeyEntry extends React.Component<Props> {

  render() {
    return template({
      whiskey: this.props.whiskey,
      onClick: this.onClick,
      onDelete: this.onDelete
    })
  }

  @boundMethod onClick(e: any) {
    this.props.onClick && this.props.onClick(this.props.whiskey)
  }

  @boundMethod onDelete(e: any) {
    this.props.onDelete && this.props.onDelete(this.props.whiskey)
  }

}
