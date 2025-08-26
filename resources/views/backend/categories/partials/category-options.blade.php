@foreach ($categories as $cat)
    @if (!isset($excludeId) || $cat->id !== $excludeId)
        <option value="{{ $cat->id }}" {{ (isset($selected) && $selected == $cat->id) ? 'selected' : '' }}>
            {{ str_repeat('— ', $level) . $cat->category_name }}
        </option>
        @if ($cat->children && $cat->children->count())
            @include('backend.categories.partials.category-options', [
                'categories' => $cat->children,
                'level' => $level + 1,
                'selected' => $selected ?? null,
                'excludeId' => $excludeId ?? null
            ])
        @endif
    @endif
@endforeach
