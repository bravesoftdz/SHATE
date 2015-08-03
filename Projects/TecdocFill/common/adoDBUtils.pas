unit adoDBUtils;

interface

uses
  DB, ADODB;

type
  IQuery = interface
  ['{24EA7670-9F1D-4409-A9EE-7818F0975536}']
    function GetSQL: string;
    procedure SetSQL(const Value: string);
    function GetActive: Boolean;
    function GetEOF: Boolean;
    function GetFields: TFields;
    function GetParameters: TParameters;
    function GetQuery: TAdoQuery;

    procedure Open;
    procedure Close;
    function Execute: Integer;
    procedure Next;
    function FieldByName(const aFieldName: string): TField;

    property Query: TAdoQuery read GetQuery;

    property SQL: string read GetSQL write SetSQL;
    property Active: Boolean read GetActive;
    property EOF: Boolean read GetEOF;
    property Fields: TFields read GetFields;
    property Parameters: TParameters read GetParameters;
  end;

function makeIQuery(aConnection: TADOConnection; const aSQL: string = ''; aCursorLocation: TCursorLocation = clUseServer; aCursorType: TCursorType = ctOpenForwardOnly): IQuery;

implementation

type
  TIQuery = class(TInterfacedObject, IQuery)
  private
    fQuery: TAdoQuery;
  protected
    { IQuery }
    function GetSQL: string;
    procedure SetSQL(const Value: string);
    function GetActive: Boolean;
    function GetEOF: Boolean;
    function GetFields: TFields;
    function GetParameters: TParameters;
    function GetQuery: TAdoQuery;

    procedure Open;
    procedure Close;
    function Execute: Integer;
    procedure Next;
    function FieldByName(const aFieldName: string): TField;

    property Query: TAdoQuery read GetQuery;

    property SQL: string read GetSQL write SetSQL;
    property Active: Boolean read GetActive;
    property EOF: Boolean read GetEOF;
    property Fields: TFields read GetFields;
    property Parameters: TParameters read GetParameters;
  public
    constructor Create(aConnection: TADOConnection; const aSQL: string = ''; aCursorLocation: TCursorLocation = clUseServer; aCursorType: TCursorType = ctOpenForwardOnly);
    destructor Destroy; override;
  end;


{ GLOBAL }

function makeIQuery(aConnection: TADOConnection; const aSQL: string = ''; aCursorLocation: TCursorLocation = clUseServer; aCursorType: TCursorType = ctOpenForwardOnly): IQuery;
begin
  Result := TIQuery.Create(aConnection, aSQL, aCursorLocation, aCursorType) as IQuery;
end;

{ TIQuery }

constructor TIQuery.Create(aConnection: TADOConnection; const aSQL: string; aCursorLocation: TCursorLocation;
  aCursorType: TCursorType);
begin
  inherited Create;
  fQuery := TAdoQuery.Create(nil);
  fQuery.Connection := aConnection;
  fQuery.CursorLocation := aCursorLocation;
  fQuery.CursorType := aCursorType;
  fQuery.SQL.Text := aSQL;
end;

destructor TIQuery.Destroy;
begin
  if fQuery.Active then
    fQuery.Close;
  fQuery.Free;

  inherited;
end;

function TIQuery.Execute: Integer;
begin
  Result := fQuery.ExecSQL;
end;

function TIQuery.FieldByName(const aFieldName: string): TField;
begin
  Result := fQuery.FieldByName(aFieldName);
end;

procedure TIQuery.Open;
begin
  fQuery.Open;
end;

procedure TIQuery.Close;
begin
  fQuery.Close;
end;

procedure TIQuery.Next;
begin
  fQuery.Next;
end;

function TIQuery.GetActive: Boolean;
begin
  Result := fQuery.Active;
end;

function TIQuery.GetEOF: Boolean;
begin
  Result := fQuery.Eof;
end;

function TIQuery.GetFields: TFields;
begin
  Result := fQuery.Fields;
end;


function TIQuery.GetParameters: TParameters;
begin
  Result := fQuery.Parameters;
end;

function TIQuery.GetQuery: TAdoQuery;
begin
  Result := fQuery;
end;

function TIQuery.GetSQL: string;
begin
  Result := fQuery.SQL.Text;
end;

procedure TIQuery.SetSQL(const Value: string);
begin
  fQuery.SQL.Text := Value;
end;

end.