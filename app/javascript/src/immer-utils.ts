import produce from 'immer';

/**
 * Update the state of a React component using ImmerJS.
 * 
 * Benefits of this wrapper over immer.produce:
 * - returns a promise of the state after performing the update
 * - does not expect a return value, letting you have more compact update calls
 * 
 * Example usages:
 * ```typescript
 * // easily update the state:
 * update(this, state => state.loading = true)
 * 
 * // passing a block of updates with update logic and deep property setting:
 * update(this, state => {
 *   state.loading = true
 *   if(newName) state.user.firstName = newName
 * })
 * 
 * // waiting for the state to be set before reading it:
 * async onButtonClick() {
 *   await update(this, state => state.active = !state.active)
 *   console.log('button active:', this.state.active)
 * }
 * 
 * ```
 * @param component the stateful React component to update the state for. Usually `this`.
 * @param updateFunction a function that receives the ImmerJS draft state, and manipulates it.
 * @returns a promise of the updated state, after the update has asynchronously been performed
 */
export async function update<State>(component: React.Component<any, State>, updateFunction: (draft: State) => void) {
  return new Promise<State>(resolve => {
    component.setState(produce(produceFn), resolve)
  })

  /** This wrapper function is used so if the updateFunction returns a value, this value is discared.
   * This allows usage of the update method like this:
   * ```update(this, state => state.loading = true)```
   */
  function produceFn(state: State) {
    updateFunction(state)
  }

}
