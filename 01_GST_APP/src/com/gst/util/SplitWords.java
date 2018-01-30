package com.gst.util;

public class SplitWords {
	public static void main(String[] args) {
		String add = "GAT NO ASHTAVINAKAYA ENGG PUNE KITHRUD";
		String message = add;
		for (int i = 0; i < message.length(); i += 15) {
			System.out.println(message.substring(i,
					Math.min(i + 15, message.length())));

		}
	}
}
