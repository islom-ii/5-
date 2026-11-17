// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $NotesTableTable extends NotesTable
    with TableInfo<$NotesTableTable, NoteModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _animationIndexMeta =
      const VerificationMeta('animationIndex');
  @override
  late final GeneratedColumn<int> animationIndex = GeneratedColumn<int>(
      'animation_index', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, content, animationIndex, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notes_table';
  @override
  VerificationContext validateIntegrity(Insertable<NoteModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('animation_index')) {
      context.handle(
          _animationIndexMeta,
          animationIndex.isAcceptableOrUnknown(
              data['animation_index']!, _animationIndexMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NoteModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NoteModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      animationIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}animation_index']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $NotesTableTable createAlias(String alias) {
    return $NotesTableTable(attachedDatabase, alias);
  }
}

class NoteModel extends DataClass implements Insertable<NoteModel> {
  final int id;
  final String title;
  final String content;
  final int? animationIndex;
  final DateTime createdAt;
  const NoteModel(
      {required this.id,
      required this.title,
      required this.content,
      this.animationIndex,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    if (!nullToAbsent || animationIndex != null) {
      map['animation_index'] = Variable<int>(animationIndex);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  NotesTableCompanion toCompanion(bool nullToAbsent) {
    return NotesTableCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      animationIndex: animationIndex == null && nullToAbsent
          ? const Value.absent()
          : Value(animationIndex),
      createdAt: Value(createdAt),
    );
  }

  factory NoteModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NoteModel(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      animationIndex: serializer.fromJson<int?>(json['animationIndex']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'animationIndex': serializer.toJson<int?>(animationIndex),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  NoteModel copyWith(
          {int? id,
          String? title,
          String? content,
          Value<int?> animationIndex = const Value.absent(),
          DateTime? createdAt}) =>
      NoteModel(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        animationIndex:
            animationIndex.present ? animationIndex.value : this.animationIndex,
        createdAt: createdAt ?? this.createdAt,
      );
  NoteModel copyWithCompanion(NotesTableCompanion data) {
    return NoteModel(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      content: data.content.present ? data.content.value : this.content,
      animationIndex: data.animationIndex.present
          ? data.animationIndex.value
          : this.animationIndex,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NoteModel(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('animationIndex: $animationIndex, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, content, animationIndex, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NoteModel &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.animationIndex == this.animationIndex &&
          other.createdAt == this.createdAt);
}

class NotesTableCompanion extends UpdateCompanion<NoteModel> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> content;
  final Value<int?> animationIndex;
  final Value<DateTime> createdAt;
  const NotesTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.animationIndex = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  NotesTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String content,
    this.animationIndex = const Value.absent(),
    required DateTime createdAt,
  })  : title = Value(title),
        content = Value(content),
        createdAt = Value(createdAt);
  static Insertable<NoteModel> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<int>? animationIndex,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (animationIndex != null) 'animation_index': animationIndex,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  NotesTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? content,
      Value<int?>? animationIndex,
      Value<DateTime>? createdAt}) {
    return NotesTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      animationIndex: animationIndex ?? this.animationIndex,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (animationIndex.present) {
      map['animation_index'] = Variable<int>(animationIndex.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotesTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('animationIndex: $animationIndex, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $NotesTableTable notesTable = $NotesTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [notesTable];
}

typedef $$NotesTableTableCreateCompanionBuilder = NotesTableCompanion Function({
  Value<int> id,
  required String title,
  required String content,
  Value<int?> animationIndex,
  required DateTime createdAt,
});
typedef $$NotesTableTableUpdateCompanionBuilder = NotesTableCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String> content,
  Value<int?> animationIndex,
  Value<DateTime> createdAt,
});

class $$NotesTableTableFilterComposer
    extends Composer<_$AppDatabase, $NotesTableTable> {
  $$NotesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get animationIndex => $composableBuilder(
      column: $table.animationIndex,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$NotesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $NotesTableTable> {
  $$NotesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get animationIndex => $composableBuilder(
      column: $table.animationIndex,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$NotesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotesTableTable> {
  $$NotesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<int> get animationIndex => $composableBuilder(
      column: $table.animationIndex, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$NotesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NotesTableTable,
    NoteModel,
    $$NotesTableTableFilterComposer,
    $$NotesTableTableOrderingComposer,
    $$NotesTableTableAnnotationComposer,
    $$NotesTableTableCreateCompanionBuilder,
    $$NotesTableTableUpdateCompanionBuilder,
    (NoteModel, BaseReferences<_$AppDatabase, $NotesTableTable, NoteModel>),
    NoteModel,
    PrefetchHooks Function()> {
  $$NotesTableTableTableManager(_$AppDatabase db, $NotesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NotesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NotesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> content = const Value.absent(),
            Value<int?> animationIndex = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              NotesTableCompanion(
            id: id,
            title: title,
            content: content,
            animationIndex: animationIndex,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            required String content,
            Value<int?> animationIndex = const Value.absent(),
            required DateTime createdAt,
          }) =>
              NotesTableCompanion.insert(
            id: id,
            title: title,
            content: content,
            animationIndex: animationIndex,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$NotesTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $NotesTableTable,
    NoteModel,
    $$NotesTableTableFilterComposer,
    $$NotesTableTableOrderingComposer,
    $$NotesTableTableAnnotationComposer,
    $$NotesTableTableCreateCompanionBuilder,
    $$NotesTableTableUpdateCompanionBuilder,
    (NoteModel, BaseReferences<_$AppDatabase, $NotesTableTable, NoteModel>),
    NoteModel,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$NotesTableTableTableManager get notesTable =>
      $$NotesTableTableTableManager(_db, _db.notesTable);
}
