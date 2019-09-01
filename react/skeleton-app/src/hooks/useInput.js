/**
 * useInput.js
 * Hook for managing inputs
 * @author Andrew Roberts
 */

import { useState } from "react";

function useInput(initialValue) {
  const [value, setValue] = useState(initialValue);

  return {
    value,
    setValue,
    reset: () => setValue(""),
    bind: {
      value,
      onChange: event => {
        setValue(event.target.value);
      }
    }
  };
}

export default useInput;
