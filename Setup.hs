import Distribution.Simple (defaultMainWithHooks)
import Distribution.Simple.Shuffle (shuffleHooks)
import Distribution.Simple.UUAGC (uuagcLibUserHook)
import UU.UUAGC (uuagc)

main :: IO ()
main = defaultMainWithHooks $ shuffleHooks $ uuagcLibUserHook uuagc
