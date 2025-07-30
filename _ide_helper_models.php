<?php

// @formatter:off
// phpcs:ignoreFile
/**
 * A helper file for your Eloquent Models
 * Copy the phpDocs from this file to the correct Model,
 * And remove them from this file, to prevent double declarations.
 *
 * @author Barry vd. Heuvel <barryvdh@gmail.com>
 */


namespace App\Models{
/**
 * 
 *
 * @property int $id
 * @property string $title
 * @property string $content
 * @property int $is_active
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Announcement newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Announcement newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Announcement query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Announcement whereContent($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Announcement whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Announcement whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Announcement whereIsActive($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Announcement whereTitle($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Announcement whereUpdatedAt($value)
 */
	class Announcement extends \Eloquent {}
}

namespace App\Models{
/**
 * 
 *
 * @property int $id
 * @property string $judul
 * @property string $slug
 * @property int $tahun_terbit
 * @property string $isbn
 * @property string $deskripsi
 * @property \App\Enums\BookStatus $kondisi
 * @property string|null $cover
 * @property int $category_id
 * @property int $publisher_id
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \App\Models\Borrowed> $borrowed
 * @property-read int|null $borrowed_count
 * @property-read \App\Models\Category $category
 * @property-read \App\Models\Publisher $publisher
 * @property-read \App\Models\Stock|null $stock
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Book filter(array $filters)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Book newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Book newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Book query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Book sorting(array $sorts)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Book whereCategoryId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Book whereCover($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Book whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Book whereDeskripsi($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Book whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Book whereIsbn($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Book whereJudul($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Book whereKondisi($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Book wherePublisherId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Book whereSlug($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Book whereTahunTerbit($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Book whereUpdatedAt($value)
 */
	class Book extends \Eloquent {}
}

namespace App\Models{
/**
 * 
 *
 * @property int $id
 * @property int $user_nisn
 * @property int $book_id
 * @property \Illuminate\Support\Carbon $borrowed_at
 * @property \Illuminate\Support\Carbon|null $returned_at
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \App\Models\ReturnBook|null $ReturnBook
 * @property-read \App\Models\Book $book
 * @property-read \App\Models\User $user
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Borrowed newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Borrowed newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Borrowed query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Borrowed whereBookId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Borrowed whereBorrowedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Borrowed whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Borrowed whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Borrowed whereReturnedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Borrowed whereUpdatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Borrowed whereUserNisn($value)
 */
	class Borrowed extends \Eloquent {}
}

namespace App\Models{
/**
 * 
 *
 * @property int $id
 * @property string $name
 * @property string $slug
 * @property string|null $description
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \App\Models\Book> $books
 * @property-read int|null $books_count
 * @method static \Database\Factories\CategoryFactory factory($count = null, $state = [])
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Category filter(array $filters)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Category newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Category newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Category query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Category sorting(array $sorts)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Category whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Category whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Category whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Category whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Category whereSlug($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Category whereUpdatedAt($value)
 */
	class Category extends \Eloquent {}
}

namespace App\Models{
/**
 * 
 *
 * @property int $id
 * @property string $name
 * @property string $slug
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \App\Models\Book> $books
 * @property-read int|null $books_count
 * @method static \Database\Factories\PublisherFactory factory($count = null, $state = [])
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Publisher filter(array $filters)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Publisher newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Publisher newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Publisher query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Publisher sorting(array $sorts)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Publisher whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Publisher whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Publisher whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Publisher whereSlug($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Publisher whereUpdatedAt($value)
 */
	class Publisher extends \Eloquent {}
}

namespace App\Models{
/**
 * 
 *
 * @property int $id
 * @property int $borrowed_id
 * @property int $book_id
 * @property int $user_nisn
 * @property \Illuminate\Support\Carbon $returned_at
 * @property \App\Enums\ReturnBookStatus $status
 * @property \App\Enums\ReturnBookCondition $kondisi
 * @property string|null $keterangan
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \App\Models\Borrowed $Borrowed
 * @property-read \App\Models\Book $book
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ReturnBook newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ReturnBook newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ReturnBook query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ReturnBook whereBookId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ReturnBook whereBorrowedId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ReturnBook whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ReturnBook whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ReturnBook whereKeterangan($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ReturnBook whereKondisi($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ReturnBook whereReturnedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ReturnBook whereStatus($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ReturnBook whereUpdatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ReturnBook whereUserNisn($value)
 */
	class ReturnBook extends \Eloquent {}
}

namespace App\Models{
/**
 * 
 *
 * @property int $id
 * @property int $book_id
 * @property int $total
 * @property int $available
 * @property int $borrowed
 * @property int $lost
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \App\Models\Book $book
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Stock newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Stock newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Stock query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Stock whereAvailable($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Stock whereBookId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Stock whereBorrowed($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Stock whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Stock whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Stock whereLost($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Stock whereTotal($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Stock whereUpdatedAt($value)
 */
	class Stock extends \Eloquent {}
}

namespace App\Models{
/**
 * 
 *
 * @property int $nisn
 * @property string $nama
 * @property string $email
 * @property \Illuminate\Support\Carbon|null $email_verified_at
 * @property string $password
 * @property string|null $remember_token
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \Illuminate\Notifications\DatabaseNotificationCollection<int, \Illuminate\Notifications\DatabaseNotification> $notifications
 * @property-read int|null $notifications_count
 * @method static \Database\Factories\UserFactory factory($count = null, $state = [])
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User whereEmail($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User whereEmailVerifiedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User whereNama($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User whereNisn($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User wherePassword($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User whereRememberToken($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User whereUpdatedAt($value)
 */
	class User extends \Eloquent implements \Illuminate\Contracts\Auth\MustVerifyEmail {}
}

