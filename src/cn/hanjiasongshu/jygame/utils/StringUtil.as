package cn.hanjiasongshu.jygame.utils
{

	import flash.utils.ByteArray;
	
	/**
	 * Utilities for manipulating and searching Strings.
	 * 
	 * @langversion 3.0
	 * @playerversion Flash 9
	 * @playerversion AIR 1.0
	 * 
	 * @author Zahoor Wang
	 */
	public final class StringUtil extends Object
	{
		
		//--------------------------------------------------------------------------
		//
		//  Class methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Compares <code>src</code> string to the <code>dst</code> string. The 
		 * result is <code>true</code> if and only if the argument is not 
		 * <code>null</code>.
		 * 
		 * @param src The string to check, may be <code>null</code>.
		 * @param dst The another string will be compared.
		 * @param ignoreCase Whether to ignore case, defaults <code>false</code>.
		 * 
		 * @return <code>true</code> if the string are equal; <code>false</code> 
		 * otherwise.
		 * 
		 * @langversion 3.0
		 * @playerversion Flash 9
		 * @playerversion AIR 1.0
		 */
		public static function equals(src:String, dst:String, 
									  ignoreCase:Boolean = false):Boolean
		{
			if (!ignoreCase) return src && dst && src === dst;
			else return src && dst && src.toLowerCase() === dst.toLowerCase();
		}
		
		/**
		 * Converts the <code>ByteArray</code> object to <code>String</code> object.
		 * 
		 * @param byteArray The <code>ByteArray</code> source.
		 * @param charSet The string denoting the character set to use to interpret 
		 * the bytes. Possible character set strings include "shift-jis", "cn-gb", 
		 * "iso-8859-1", and others. For a complete list see 
		 * <a href="http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/charset-codes.html" target="mm_external">Supported Character Sets</a>.
		 * @param endian Changes or reads the byte order for the data; either 
		 * <code>Endian.BIG_ENDIAN</code> or <code>Endian.LITTLE_ENDIAN</code>.
		 * @param isUncompress Whether to uncompress.
		 * @param algorithm The compression algorithm to use when compressing. 
		 * Valid values are defined as constants in the <code>CompressionAlgorithm
		 * </code> class. The default is to use <b>zlib</b> format. <i>Support for
		 * the <b>lzma</b> aligorithm was added Flash Player 11.3 and AIR 3.3. You
		 * must have those player versions, or later, to use <b>lzma</b> 
		 * compression.</i>
		 * 
		 * @return The string. If the <code>byteArray</code> is <code>null</code> 
		 * or <code>undefined</code>, return <code>null</code>.
		 * 
		 * @see flash.utils.Endian
		 * @see flash.utils.CompressionAlgorithm
		 * @see http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/charset-codes.html Supported Character Sets
		 * 
		 * @langversion 3.0
		 * @playerversion Flash 9
		 * @playerversion AIR 1.0
		 */
		public static function fromByteArray(byteArray:ByteArray, 
											 charSet:String = "utf-8", 
											 endian:String = "bigEndian",
											 isUncompress:Boolean = false,
											 algorithm:String = "zlib"):String
		{
			if (!byteArray) return null;
			byteArray.position = 0;
			byteArray.endian = endian;
			isUncompress && byteArray.uncompress(algorithm);
			return byteArray.readMultiByte(byteArray.bytesAvailable, charSet);
		}
		
		/**
		 * Checks if a string has length.
		 * 
		 * @param str The string to check, may be <code>null</code>.
		 * 
		 * @return <code>true</code> if the string is not <code>null</code> and has 
		 * length.
		 * 
		 * @langversion 3.0
		 * @playerversion Flash 9
		 * @playerversion AIR 1.0
		 */
		public static function hasLength(str:String):Boolean
		{
			return str && str.length;
		}
		
		/**
		 * Checks if a string has test. More specifically, returns <code>true</code> 
		 * if the string not <code>null</code>, it's length is > 0, and it has at 
		 * least one non-whitespace character.
		 * 
		 * @param str The string to check, may be <code>null</code>.
		 * 
		 * @return <code>true</code> if the string is not <code>null</code>. 
		 * length > 0, and not whitespace only.
		 * 
		 * @langversion 3.0
		 * @playerversion Flash 9
		 * @playerversion AIR 1.0
		 */
		public static function hasText(str:String):Boolean
		{
			return str && trim(str).length;
		}
		
		/**
		 * Returns <code>true</code> if the specified string has length.
		 * 
		 * @param str The string to check, may be <code>null</code>.
		 * 
		 * @return <code>true</code> if the string has length, <code>false</code> 
		 * otherwise.
		 * 
		 * @langversion 3.0
		 * @playerversion Flash 9
		 * @playerversion AIR 1.0
		 */
		public static function isEmpty(str:String):Boolean
		{
			return hasLength(str);
		}
		
		/**
		 * Returns <code>true</code> if the specified string is a single space, tab,
		 * carriage return, newline, or formfeed character.
		 * 
		 * @param char The string that is begin queried.
		 * 
		 * @return <code>true</code> if the specified string is a single space, tab,
		 * carriage return, newline, or formfeed character.
		 * 
		 * @langversion 3.0
		 * @playerversion Flash 9
		 * @playerversion AIR 1.0
		 */
		public static function isWhitespace(char:String):Boolean
		{
			switch (char)
			{
				case " ":
				case "\t":
				case "\r":
				case "\n":
				case "\f":
					return true;
			}
			return false;
		}
		
		/**
		 * Checks the string starts with the specified prefix.
		 * 
		 * @param str The string to check, may be <code>null</code>.
		 * @param prefix The prefix string to check, may be <code>null</code>.
		 * @param ignoreCase Whether to ignore case, defaults <code>false</code>.
		 * 
		 * @reutrn <code>true</code> if the string represented by the argument is a
		 * prefix of the string represented by this string; <code>false</code>
		 * otherwise.
		 * 
		 * @langversion 3.0
		 * @playerversion Flash 9
		 * @playerversion AIR 1.0
		 */
		public static function isPrefix(str:String, prefix:String, 
										ignoreCase:Boolean = false):Boolean
		{
			if (str && prefix && (str.length >= prefix.length))
				return equals(str.substring(0, prefix.length), prefix, ignoreCase);
			return false;
		}
		
		/**
		 * Checks the string ends with specified suffix.
		 * 
		 * @param str The string to check, may be <code>null</code>.
		 * @param suffix The suffix string to check, may be <code>null</code>.
		 * @parma ignoreCase Whether to ignore case, defaults <code>false</code>.
		 * 
		 * @return <code>true</code> if the string represented by the argument is a 
		 * suffix of the string represented by this string; <code>false</code>
		 * otherwise.
		 * 
		 * @langversion 3.0
		 * @playerversion Flash 9
		 * @playerversion AIR 1.0
		 */
		public static function isSuffix(str:String, suffix:String, 
										ignoreCase:Boolean = false):Boolean
		{
			if (str && suffix && (str.length >= suffix.length))
				return equals(str.substr(str.length - suffix.length, str.length), 
							  suffix, ignoreCase);
			return false;
		}
		
		/**
		 * Returns a string consisting of a specified string concatenated with 
		 * itself a specified number of times.
		 * 
		 * @param str The string to be repeated.
		 * @param n The repeat count.
		 * 
		 * @return The repeated string.
		 * 
		 * @langversion 3.0
		 * @playerversion Flash 9
		 * @playerversion AIR 1.0
		 */
		public static function repeat(str:String, n:int):String
		{
			if (n == 0) return "";
			var s:String = str;
			for (var i:int = 1; i < n; i++)
				s += str;
			return s;
		}
		
		/**
		 * Returns a string starts with new prefix.
		 * 
		 * @param str The string to be replaced.
		 * @param prefix The old prefix string.
		 * @param repl The new prefix string.
		 * @param ignoreCase The prefix whether the ignore case.
		 * 
		 * @return The replaced string.
		 * 
		 * @langversion 3.0
		 * @playerversion Flash 9
		 * @playerversion AIR 1.0
		 */
		public static function replacePrefix(str:String, 
											 prefix:String = "", repl:String = "",
											 ignoreCase:Boolean = false):String
		{
			if (! str) return "";
			repl ||= "";
			prefix ||= "";
			return str.replace(new RegExp("^" + prefix, ignoreCase ? "i" : null), 
							   repl);
		}
		
		/**
		 * Returns a string ends with new suffix.
		 * 
		 * @param str The string to be replaced.
		 * @param suffix The old suffix string.
		 * @param repl The new suffix string.
		 * @param ignoreCase The suffix whether the ignore case.
		 * 
		 * @return The replaced string.
		 * 
		 * @langversion 3.0
		 * @playerversion Flash 9
		 * @playerversion AIR 1.0
		 */
		public static function replaceSuffix(str:String, 
											 suffix:String = "", repl:String = "", 
											 ignoreCase:Boolean = false):String
		{
			if (! str) return "";
			repl ||= "";
			suffix ||= "";
			return str.replace(new RegExp(suffix + "$", ignoreCase ? "i" : null), 
							   repl);
		}
		
		/**
		 * Removes "unallowed" characters from a string. A "restriction string" 
		 * such as <code>"A-Z0-9"</code> is used to specify which characters are 
		 * allowed.
		 * This method uses the same logic as the <code>restrict</code> property of 
		 * <code>TextField</code>.
		 * 
		 * @param str The input string.
		 * @param restrict The restriction string.
		 * 
		 * @return The input string, minus any characters that are not allowed by 
		 * the restriction string.
		 * 
		 * @langversion 3.0
		 * @playerversion Flash 9
		 * @playerversion AIR 1.0
		 */
		public static function restrict(str:String, restrict:String):String
		{
			// A null 'restrict' string means all characters are allowed.
			if (restrict == null) return str;
			// An empty 'restrict' string means no characters are allowed.
			if (restrict == "") return "";
			// Otherwise, we need to test each character in 'str'
			// to determine whether the 'restrict' string allows it.
			var charCodes:Array = [];
			var n:int = str.length;
			for (var i:int = 0; i < n; i++)
			{
				var charCode:uint = str.charCodeAt(i);
				if (testCharacter(charCode, restrict)) charCodes.push(charCode);
			}
			return String.fromCharCode.apply(null, charCodes);
		}
		
		/**
		 * Substitutes "{n}" tokens within the specified string with the respective 
		 * arguments passed in.
		 * 
		 * @param str The string to make substitutions in. This string can contain 
		 * special tokens of the form <code>{n}</code>, where <code>n</code> is a 
		 * zero based index, that will be replaced with the additional parameters 
		 * found at that index if specified.
		 * @param rest Additional parameters that can be substituted in the 
		 * <code>str</code> parameter at each <code>{n}</code> location, where 
		 * <code>n</code> is an integer (zero based) index value into the array of 
		 * values specified.
		 * 
		 * @return New string with all of the <code>{n}</code> tokens replaced with 
		 * the respective arguments specified.
		 * 
		 * @langversion 3.0
		 * @playerversion Flash 9
		 * @playerversion AIR 1.0
		 */
		public static function substitute(str:String, ... rest):String
		{
			if (!str) return "";
			for (var i:int = 0, l:uint = rest.length; i < l; i++)
				str = str.replace(new RegExp("\\{" + i + "\\}", "g"), String(rest[i]));
			return str;
		}
		
		/**
		 * Converts the <code>String</code> object to <code>ByteArray</code> object.
		 * 
		 * @param src The string source.
		 * @param charSet The string denoting the character set to use to interpret
		 * the bytes. Possible character set strings include "shift-jis", "cn-gb", 
		 * "iso-8859-1", and others. For a complete list, see
		 * <a href="http://help.adobe.com/zh_CN/FlashPlatform/reference/actionscript/3/charset-codes.html" target="mm_external">Supported Character Sets</a>.
		 * @param endian Changes or reads the byte order for the data; either 
		 * <code>Endian.BIG_ENDIAN</code> or <code>Endian.LITTLE_ENDIAN</code>.
		 * @param isCompress Whether to compress.
		 * @param algorithm The compression algorithm to use when compressing. 
		 * Valid values are defined as constants in the <code>CompressionAlgorithm
		 * </code> class. The default is to use <b>zlib</b> format. <i>Support for
		 * the <b>lzma</b> aligorithm was added Flash Player 11.3 and AIR 3.3. You
		 * must have those player versions, or later, to use <b>lzma</b> 
		 * compression.</i>
		 * 
		 * @return The <code>ByteArray</code> object. If the <code>src</code> is
		 * <code>null</code> or <code>undefined</code>, return <code>null</code>.
		 * 
		 * @see flash.utils.Endian
		 * @see flash.utils.CompressionAlgorithm
		 * @see http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/charset-codes.html Supported Character Sets
		 * 
		 * @langversion 3.0
		 * @playerversion Flash 9
		 * @playerversion AIR 1.0
		 */
		public static function toByteArray(src:String, 
										   charSet:String = "utf-8", 
										   endian:String = "bigEndian",
										   isCompress:Boolean = false,
										   algorithm:String = "zlib"):ByteArray
		{
			if (!src) return null;
			var bytes:ByteArray = new ByteArray();
			bytes.endian = endian;
			bytes.writeMultiByte(src, charSet);
			bytes.position = 0;
			isCompress && bytes.compress(algorithm);
			return bytes;
		}
		
		/**
		 * Removes all whitespace characters from the beginning and end of the 
		 * specified string.
		 * 
		 * @param str The string whose whitespace should be trimmed.
		 * 
		 * @return Updated string where whitespace was removed from the beginning
		 * and end.
		 * 
		 * @langversion 3.0
		 * @playerversion Flash 9
		 * @playerversion AIR 1.0
		 */
		public static function trim(str:String, left:Boolean = true, 
									right:Boolean = true):String
		{
			
			if (!str) return "";
			
			var startIndex:int = 0;
			while (left && isWhitespace(str.charAt(startIndex)))
				++startIndex;
			
			var endIndex:int = str.length - 1;
			while (right && isWhitespace(str.charAt(endIndex))) 
				--endIndex;
			
			return endIndex >= startIndex ? 
				   str.slice(startIndex, endIndex + 1) : 
				   "";
		}
		
		/**
		 * Helper method used by <code>restrict()</code> to test each character in 
		 * the input string against the restriction string.
		 * The logic in this method implements the same algorithm as in TextField's
		 * 'restrict' property (which is quirky, such as how it handles a '-' at 
		 * the beginning of the restriction string).
		 * 
		 * @private
		 */
		private static function testCharacter(charCode:uint, restrict:String):Boolean
		{
			var allowIt:Boolean = false;
			
			var inBackSlash:Boolean = false, inRange:Boolean = false, setFlag:Boolean = true;
			var lastCode:uint = 0, code:uint;
			var n:int = restrict.length;
			
			if (n > 0)
			{
				code = restrict.charCodeAt(0);
				if (code == 94) // caret
					allowIt = true;
			}
			
			for (var i:int = 0; i < n; i++)
			{
				code = restrict.charCodeAt(i);
				var acceptCode:Boolean = false;
				if (!inBackSlash)
				{
					if (code == 45) // hyphen
						inRange = true;
					else if (code == 94) // caret
						setFlag = !setFlag;
					else if (code == 92) // backslash
						inBackSlash = true;
					else
						acceptCode = true;
				} 
				else
				{
					acceptCode = true;
					inBackSlash = false;
				}
				
				if (acceptCode)
				{
					if (inRange)
					{
						if (lastCode <= charCode && charCode <= code)
							allowIt = setFlag;
						inRange = false;
						lastCode = 0;
					} 
					else
					{
						if (charCode == code)
							allowIt = setFlag;
						lastCode = code;
					}
				}
			}
			
			return allowIt;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Constructor.
		 * 
		 * @private
		 */
		public function StringUtil()
		{
		}
		
	}
}