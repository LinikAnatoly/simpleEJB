unit ShowENWarrant;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList, Grids,
  ComCtrls, ToolWin, Menus, ActnList, BaseGrid, AdvGrid, XSBuiltIns,
  DialogFormUnit, DlgUnit, GridHeadersUnit, EnergyProController,
  EnergyProController2, ENWarrantController, AdvObj, ENWarrantTypeController;

type
    TfrmENWarrantShow = class(TChildForm)
    HTTPRIOENWarrant: THTTPRIO;
    ImageList1: TImageList;
    sgENWarrant: TAdvStringGrid;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    btnCopyWarrant: TToolButton;
    actCopyWarrant: TAction;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgENWarrantTopLeftChanged(Sender: TObject);
    procedure sgENWarrantDblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure actCopyWarrantExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure setENWarrantShortToGrid(warrant : ENWarrantShort; grid : TAdvStringGrid;
        pos : Integer; isForFromSideType : Boolean);
  private
   { Private declarations }
  public
   {если true - то отображаются только доверенности сторонних организаций}
    isForFromSideType: Boolean;
    enwarrantTypeCode: Integer;
	class function chooseFromList(isForFromSideType : Boolean; disableEdit : Boolean = True) : ENWarrantShort; stdcall; static;
   { Public declarations }
    procedure UpdateGrid(Sender: TObject);
  end;

var
 frmENWarrantShow : TfrmENWarrantShow;
 // ENWarrantObj: ENWarrant;
 // ENWarrantFilterObj: ENWarrantFilter;

implementation

uses
  Main, EditENWarrant, EditENWarrantFilter, ENConsts;


{$R *.dfm}

var
  //frmENWarrantShow : TfrmENWarrantShow;

  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENWarrantHeaders: array[1..9] of string = ('Код', 'Номер довіреності', 'Назва (предмет довіреності)', 'П.І.Б. довіреної особи', 'Посада довіреної особи', 'Паспортні дані довіреної особи', 'Адреса довіреної особи', 'Потужність', 'Гранічна сума');
  ENWarrantHeadersFromSide: array[1..4] of string = ('Код', 'Номер довіреності'
  , 'П.І.Б. довіреної особи', 'Посада довіреної особи');
  ENWarrantHeadersDecreeRespons: array[1..4] of string = ('Код', 'Номер довіреності', 'П.І.Б. відповідальної особи', 'Посада відповідальної особи');

class function TfrmENWarrantShow.chooseFromList(isForFromSideType : Boolean; disableEdit : Boolean = True) : ENWarrantShort;
var
  f : ENWarrantFilter;
  frmENWarrantShow : TfrmENWarrantShow;
  selectedWarrant : ENWarrantShort;
begin
  inherited;
   f := ENWarrantFilter.Create;
   SetNullXSProps(f);
   SetNullIntProps(f);
   frmENWarrantShow:=TfrmENWarrantShow.Create(Application,fmNormal, f);
	 frmENWarrantShow.isForFromSideType := isForFromSideType;
	 selectedWarrant := nil;
       try
          with frmENWarrantShow do
          begin
            if disableEdit then DisableActions([ actEdit, actInsert
              , actDelete, actCopyWarrant]);
            if ShowModal = mrOk then
            begin
                try
                  selectedWarrant := ENWarrantShort(sgENWarrant.Objects[0, sgENWarrant.Row]);
                except
                   on EConvertError do Exit;
                end;
            end;
          end;
    finally
      frmENWarrantShow.Free;
    end;
	Result := selectedWarrant;
end;

procedure TfrmENWarrantShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENWarrantShow := nil;
  inherited;
end;

procedure TfrmENWarrantShow.FormCreate(Sender: TObject);
begin
  inherited;
  enwarrantTypeCode:= 0;
end;

procedure TfrmENWarrantShow.setENWarrantShortToGrid(warrant : ENWarrantShort; grid : TAdvStringGrid;
  pos : Integer; isForFromSideType : Boolean);
begin
  with grid do begin
    if ((not isForFromSideType) AND (enwarrantTypeCode <> ENConsts.ENWARRANT_TYPE_DECREE_RESPONS)) then begin
      if warrant.code <> Low(Integer) then
        Cells[0, pos] := IntToStr(warrant.code)
      else
        Cells[0, pos] := '';
      Cells[1, pos] := warrant.numbergen;
      Cells[2, pos] := warrant.name;
      if (enwarrantTypeCode = ENConsts.ENWARRANT_TYPE_RQFKORDER) then
      Cells[3, pos] := warrant.warrantShortFIO
      else
      Cells[3, pos] := warrant.warrantFIO;

      Cells[4, pos] := warrant.warrantPosition;
      Cells[5, pos] := warrant.passport;
      Cells[6, pos] := warrant.address;
      if warrant.power = Low(Integer) then
        Cells[7, pos] := ''
      else
        Cells[7, pos] := IntToStr(warrant.power);
      if warrant.maxSum = nil then
        Cells[8, pos] := ''
      else
        Cells[8, pos] := warrant.maxSum.DecimalString;

        if warrant.dateGen = nil then
          Cells[9,pos] := ''
        else
          Cells[9,pos] := XSDate2String(warrant.dateGen);

    end else begin
      if warrant.code <> Low(Integer) then
        Cells[0, pos] := IntToStr(warrant.code)
      else
        Cells[0, pos] := '';
      Cells[1, pos] := warrant.numbergen;
      Cells[2, pos] := warrant.warrantFIO;
      Cells[3, pos] := warrant.warrantPosition;
    end;
    Objects[0, pos] := warrant;
  end;
end;

procedure TfrmENWarrantShow.FormShow(Sender: TObject);
var
  TempENWarrant: ENWarrantControllerSoapPort;
  i: Integer;
  ENWarrantList: ENWarrantShortList;
begin

 if (enwarrantTypeCode =  ENConsts.ENWARRANT_TYPE_RQFKORDER) then
  DisableActions([actNoFilter , actDelete]);

  if (enwarrantTypeCode =  ENConsts.ENWARRANT_TYPE_DECREE_RESPONS )
     then Caption:='Відповідальна особа';

  if ((not isForFromSideType) and (enwarrantTypeCode <> ENConsts.ENWARRANT_TYPE_DECREE_RESPONS)) then begin
    SetGridHeaders(ENWarrantHeaders, sgENWarrant.ColumnHeaders);
  end else if enwarrantTypeCode=ENConsts.ENWARRANT_TYPE_DECREE_RESPONS then
     begin
      sgENWarrant.ColCount := 4;
      SetGridHeaders(ENWarrantHeadersDecreeRespons, sgENWarrant.ColumnHeaders);
     end
   else
   begin
    sgENWarrant.ColCount := 4;
    SetGridHeaders(ENWarrantHeadersFromSide, sgENWarrant.ColumnHeaders);
  end;
  ColCount := 100;
  TempENWarrant := HTTPRIOENWarrant as ENWarrantControllerSoapPort;

  if FilterObject = nil then
  begin
    FilterObject := ENWarrantFilter.Create;
    SetNullIntProps(FilterObject);
    SetNullXSProps(FilterObject);
  end;

  if ((not isForFromSideType ) and (enwarrantTypeCode=0) ) then
  begin
    ENWarrantList := TempENWarrant.getScrollableFilteredList(ENWarrantFilter(FilterObject), 0, ColCount);
  end
  else if enwarrantTypeCode=ENConsts.ENWARRANT_TYPE_DECREE_RESPONS then
  begin
    ENWarrantList := TempENWarrant.getScrollableFilteredList(ENWarrantFilter(FilterObject), 0, ColCount, ENConsts.ENWARRANT_TYPE_DECREE_RESPONS);
  end
  else if enwarrantTypeCode=ENConsts.ENWARRANT_TYPE_RQFKORDER then
  begin
    ENWarrantList := TempENWarrant.getScrollableFilteredList(ENWarrantFilter(FilterObject), 0, ColCount, ENConsts.ENWARRANT_TYPE_RQFKORDER);
  end
  else
  begin
    ENWarrantList := TempENWarrant.getScrollableFilteredList(ENWarrantFilter(FilterObject), 0, ColCount, ENConsts.ENWARRANT_TYPE_FROM_SIDE);
  end;

  LastCount := High(ENWarrantList.list);

  if LastCount > -1 then
    sgENWarrant.RowCount := LastCount + 2
  else
    sgENWarrant.RowCount := 2;

  with sgENWarrant do
    for i := 0 to LastCount do
    begin
      Application.ProcessMessages;
      setENWarrantShortToGrid(ENWarrantList.list[i], sgENWarrant
        , i + 1, Self.isForFromSideType);
      LastRow := i + 1;
      sgENWarrant.RowCount := LastRow + 1;
    end;
  ColCount := ColCount + 1;
  sgENWarrant.Row := 1;
end;

procedure TfrmENWarrantShow.sgENWarrantTopLeftChanged(Sender: TObject);
var
  TempENWarrant: ENWarrantControllerSoapPort;
  i, CurrentRow: Integer;
  ENWarrantList: ENWarrantShortList;
begin
  if LastCount < 99 then
    Exit;
  if (sgENWarrant.TopRow + sgENWarrant.VisibleRowCount) = ColCount then
  begin
    TempENWarrant := HTTPRIOENWarrant as ENWarrantControllerSoapPort;
    CurrentRow := sgENWarrant.RowCount;

    if FilterObject = nil then
    begin
      FilterObject := ENWarrantFilter.Create;
      SetNullIntProps(FilterObject);
      SetNullXSProps(FilterObject);
    end;

    if not isForFromSideType then
    begin
      ENWarrantList := TempENWarrant.getScrollableFilteredList(ENWarrantFilter(FilterObject), 0, ColCount);
    end
    else
    begin
      ENWarrantList := TempENWarrant.getScrollableFilteredList(ENWarrantFilter(FilterObject), 0, ColCount, ENConsts.ENWARRANT_TYPE_FROM_SIDE);
    end;

    sgENWarrant.RowCount := sgENWarrant.RowCount + 100;
    LastCount := High(ENWarrantList.list);
    with sgENWarrant do
      for i := 0 to LastCount do
      begin
        Application.ProcessMessages;
        setENWarrantShortToGrid(ENWarrantList.list[i], sgENWarrant
          , i + CurrentRow, Self.isForFromSideType);
        LastRow := i + CurrentRow;
      end;
    ColCount := ColCount + 100;
    sgENWarrant.Row := CurrentRow - 5;
    sgENWarrant.RowCount := LastRow + 1;
  end;
end;

procedure TfrmENWarrantShow.sgENWarrantDblClick(Sender: TObject);
var
  temp: Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp := StrToInt(GetReturnValue(sgENWarrant, 0));
    except
      on EConvertError do
        Exit;
    end;
    ModalResult := mrOk;
  end
  else
  begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENWarrantShow.UpdateGrid(Sender: TObject);
var
  i, j: Integer;
begin
  for i := 1 to sgENWarrant.RowCount - 1 do
    for j := 0 to sgENWarrant.ColCount - 1 do
      sgENWarrant.Cells[j, i] := '';
  FormShow(Sender);
end;

procedure TfrmENWarrantShow.actViewExecute(Sender: TObject);
var
  TempENWarrant: ENWarrantControllerSoapPort;
begin
  TempENWarrant := HTTPRIOENWarrant as ENWarrantControllerSoapPort;
  try
    ENWarrantObj := TempENWarrant.getObject(StrToInt(sgENWarrant.Cells[0, sgENWarrant.Row]));
  except
    on EConvertError do
      Exit;
  end;
  frmENWarrantEdit := TfrmENWarrantEdit.Create(Application, dsView);

  if enwarrantTypeCode<>0 then
    begin
      ENWarrantObj.warrantTypeRef:= ENWarrantTypeRef.Create;
      ENWarrantObj.warrantTypeRef.code:=enwarrantTypeCode;
      frmENWarrantEdit.enwarrantTypeCode:= enwarrantTypeCode;
    end;
  try
    frmENWarrantEdit.ShowModal;
  finally
    frmENWarrantEdit.Free;
    frmENWarrantEdit := nil;
  end;
end;

procedure TfrmENWarrantShow.actEditExecute(Sender: TObject);
var
  TempENWarrant: ENWarrantControllerSoapPort;
begin
  TempENWarrant := HTTPRIOENWarrant as ENWarrantControllerSoapPort;
  try
    ENWarrantObj := TempENWarrant.getObject(StrToInt(sgENWarrant.Cells[0, sgENWarrant.Row]));
  except
    on EConvertError do
      Exit;
  end;
  frmENWarrantEdit := TfrmENWarrantEdit.Create(Application, dsEdit);
  if enwarrantTypeCode<>0 then
    begin
      ENWarrantObj.warrantTypeRef:= ENWarrantTypeRef.Create;
      ENWarrantObj.warrantTypeRef.code:=enwarrantTypeCode;
      frmENWarrantEdit.enwarrantTypeCode:= enwarrantTypeCode;
    end;
  try
    if frmENWarrantEdit.ShowModal = mrOk then
    begin
        //TempENWarrant.save(ENWarrantObj);
      UpdateGrid(Sender);
    end;
  finally
    frmENWarrantEdit.Free;
    frmENWarrantEdit := nil;
  end;
end;

procedure TfrmENWarrantShow.actCopyWarrantExecute(Sender: TObject);
var
  TempENWarrant: ENWarrantControllerSoapPort;
begin
  TempENWarrant := HTTPRIOENWarrant as ENWarrantControllerSoapPort;
  try
    ENWarrantObj := TempENWarrant.getObject(StrToInt(sgENWarrant.Cells[0, sgENWarrant.Row]));
  except
    on EConvertError do
      Exit;
  end;
  ENWarrantObj.code := Low(Integer);
  frmENWarrantEdit := TfrmENWarrantEdit.Create(Application, dsInsert);
  frmENWarrantEdit.isForCopy := True;
  try
    if frmENWarrantEdit.ShowModal = mrOk then
    begin
        //TempENWarrant.save(ENWarrantObj);
      UpdateGrid(Sender);
    end;
  finally
    frmENWarrantEdit.Free;
    frmENWarrantEdit := nil;
  end;
end;

procedure TfrmENWarrantShow.actDeleteExecute(Sender: TObject);
var
  TempENWarrant: ENWarrantControllerSoapPort;
  ObjCode: Integer;
begin
  TempENWarrant := HTTPRIOENWarrant as ENWarrantControllerSoapPort;
  try
    ObjCode := StrToInt(sgENWarrant.Cells[0, sgENWarrant.Row]);
  except
    on EConvertError do
      Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Доверенности) ?'), PChar('Внимание !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENWarrant.remove(ObjCode);
    UpdateGrid(Sender);
  end;
end;


procedure TfrmENWarrantShow.actInsertExecute(Sender: TObject);
var
  TempENWarrant: ENWarrantControllerSoapPort;
begin
  TempENWarrant := HTTPRIOENWarrant as ENWarrantControllerSoapPort;
  ENWarrantObj := ENWarrant.Create;

  try
    frmENWarrantEdit := TfrmENWarrantEdit.Create(Application, dsInsert);
    frmENWarrantEdit.isForFromSideType := Self.isForFromSideType;

    if enwarrantTypeCode = ENConsts.ENWARRANT_TYPE_DECREE_RESPONS then
       frmENWarrantEdit.Caption:= 'Відповідальна особа';
    if enwarrantTypeCode = ENConsts.ENWARRANT_TYPE_RQFKORDER then
       frmENWarrantEdit.Caption:= 'Довіреність';

    if enwarrantTypeCode<>0 then
    begin
      ENWarrantObj.warrantTypeRef := ENWarrantTypeRef.Create;
      ENWarrantObj.warrantTypeRef.code := enwarrantTypeCode;
      frmENWarrantEdit.enwarrantTypeCode := enwarrantTypeCode;
    end;

    try
      if frmENWarrantEdit.ShowModal = mrOk then
      begin
        if ENWarrantObj <> nil then
        begin
          if ENWarrantObj.code <> Low(Integer) then
          begin
            FilterObject := ENWarrantFilter.Create;
            SetNullIntProps(FilterObject);
            SetNullXSProps(FilterObject);
            ENWarrantFilter(FilterObject).code := ENWarrantObj.code;
          end;

          UpdateGrid(Sender);
        end;
      end;
    finally
      frmENWarrantEdit.Free;
      frmENWarrantEdit := nil;
    end;
  finally
    ENWarrantObj.Free;
  end;
end;


procedure TfrmENWarrantShow.actUpdateExecute(Sender: TObject);
begin
  UpdateGrid(Sender);
end;

procedure TfrmENWarrantShow.actFilterExecute(Sender: TObject);
begin
  frmENWarrantFilterEdit := TfrmENWarrantFilterEdit.Create(Application, dsInsert);
  try
    ENWarrantFilterObj := ENWarrantFilter.Create;
    SetNullIntProps(ENWarrantFilterObj);
    SetNullXSProps(ENWarrantFilterObj);

    if enwarrantTypeCode<>0 then
    begin
     ENWarrantFilterObj.warrantTypeRef:= ENWarrantTypeRef.Create;
     ENWarrantFilterObj.warrantTypeRef.code:=enwarrantTypeCode;
    end;

    if frmENWarrantFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENWarrantFilter.Create;
      FilterObject := ENWarrantFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENWarrantFilterEdit.Free;
    frmENWarrantFilterEdit := nil;
  end;
end;

procedure TfrmENWarrantShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.

