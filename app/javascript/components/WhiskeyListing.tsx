import { boundMethod } from 'autobind-decorator';
import React from "react";
import { update } from '../src/immer-utils';
import { Whiskey } from "../src/model";
import { WhiskeyWiseAPI } from "../src/WhiskeyWiseAPI";
import template from './WhiskeyListing.pug';
import WhiskeyEntry from './WhiskeyEntry';
import _, { debounce } from 'lodash';

interface Props {
  baseUrl?: string
  new_whiskey_url: string
}

interface State {
  whiskeys: Whiskey[]
  contains?: string
  color?: number
  smokey?: number
  taste?: number
}

export default class WhiskeyListing extends React.Component<Props, State> {

  api: WhiskeyWiseAPI

  constructor(props: Props) {
    super(props)
    this.api = new WhiskeyWiseAPI(this.props.baseUrl)
    this.state = {
      whiskeys: []
    }
  }

  componentDidMount() {
    this.loadWhiskeys()
  }

  render() {
    return template({
      whiskeys: this.state.whiskeys,
      containsValue: this.state.contains,
      smokeyValue: this.state.smokey,
      tasteValue: this.state.taste,
      colorValue: this.state.color,

      onNewWhiskeyClick: this.onNewWhiskeyClick,
      onWhiskeyClick: this.onWhiskeyClick,
      onWhiskeyDelete: this.onWhiskeyDelete,
      onContainsChange: debounce(this.onContainsChange, 150, { leading: true, trailing: false, maxWait: 250 }),
      onSmokeyChange: debounce(this.onSmokeyChange, 150, { leading: true, trailing: false, maxWait: 250 }),
      onTasteChange: debounce(this.onTasteChange, 150, { leading: true, trailing: false, maxWait: 250 }),
      onColorChange: debounce(this.onColorChange, 150, { leading: true, trailing: false, maxWait: 250 }),

      WhiskeyEntry
    })
  }

  @boundMethod onNewWhiskeyClick() {
    window.location.href = this.props.new_whiskey_url
  }

  @boundMethod onWhiskeyClick(whiskey: Whiskey) {
    alert(`Clicked whiskey ${whiskey.name}`)
  }

  @boundMethod onWhiskeyDelete(whiskey: Whiskey) {
    const confirmed = confirm(`Are you sure you want to delete the ${whiskey.name}?`)

    if (confirmed) this.deleteWhiskey(whiskey)
  }

  @boundMethod async onContainsChange(event: React.SyntheticEvent<HTMLInputElement>) {
    event.persist()
    const value = event.currentTarget.value
    await update(this, state => state.contains = value)
    this.loadWhiskeys()
  }

  @boundMethod async onSmokeyChange(event: React.SyntheticEvent<HTMLInputElement>) {
    console.log('HEY!')
    event.persist()
    const value = event.currentTarget.value
    await update(this, state => state.smokey = parseInt(value))
    this.loadWhiskeys()
  }

  @boundMethod async onTasteChange(event: React.SyntheticEvent<HTMLInputElement>) {
    event.persist()
    const value = event.currentTarget.value
    await update(this, state => state.taste = parseInt(value))
    this.loadWhiskeys()
  }

  @boundMethod async onColorChange(event: React.SyntheticEvent<HTMLInputElement>) {
    event.persist()
    const value = event.currentTarget.value
    await update(this, state => state.color = parseInt(value))
    this.loadWhiskeys()
  }

  @boundMethod async loadWhiskeys() {
    const whiskeys = await this.api.search({
      contains: this.state.contains,
      color: this.state.color,
      smokey: this.state.smokey,
      taste: this.state.taste
    })
    update(this, state => state.whiskeys = whiskeys)
  }

  @boundMethod async deleteWhiskey(whiskey: Whiskey) {
    await this.api.deleteWhiskey(whiskey.id)
    await this.loadWhiskeys()
  }

}
