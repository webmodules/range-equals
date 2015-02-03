function rangeEquals(r1, r2) {
  return (r1 === r2) || (r1 && r2 &&
      r1.startContainer === r2.startContainer &&
      r1.startOffset === r2.startOffset &&
      r1.endContainer === r2.endContainer &&
      r1.endOffset === r2.endOffset
    );
}

export default rangeEquals;