import Image from "next/image";
import Link from "next/link";

export default function Logo() {
  return (
    <Link href="/" className="inline-flex" aria-label="Cruip">
     <Image src="/images/anm_timor_leste_logo.jpeg" alt="anm-logo" width={35} height={35} />
     <p className="p-2 ">ANM Timor-Leste</p> 
    </Link>
  );
}
