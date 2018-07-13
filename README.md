```
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

# Usage

1. `getlinks.sh` gets links (will prompt you for login and password) 
	- require [phantomjs][1]
	- this step might need to done multiple times to get all the links
2. `getpdfs.sh` downloads the subjects from the links.
3. `compare.sh <folder1/> <folder2/>` will compare two folders made by the
	previous step.

Happy 9th day.

[1]: http://phantomjs.org/download.html
