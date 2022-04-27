
unit ShowENNormativeVolumeAVZ;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
    ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns,
    DialogFormUnit, DlgUnit, GridHeadersUnit,
    EnergyProController, EnergyProController2,
    ENNormativeVolumeAVZController, AdvObj ;


type
    TfrmENNormativeVolumeAVZShow = class(TChildForm)
    HTTPRIOENNormativeVolumeAVZ: THTTPRIO;
    ImageList1: TImageList;
    sgENNormativeVolumeAVZ: TAdvStringGrid;
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

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgENNormativeVolumeAVZTopLeftChanged(Sender: TObject);
    procedure sgENNormativeVolumeAVZDblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // ENNormativeVolumeAVZObj: ENNormativeVolumeAVZ;
 // ENNormativeVolumeAVZFilterObj: ENNormativeVolumeAVZFilter;
  
  
implementation

uses Main, EditENNormativeVolumeAVZ, EditENNormativeVolumeAVZFilter;


{$R *.dfm}

var
  //frmENNormativeVolumeAVZShow : TfrmENNormativeVolumeAVZShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENNormativeVolumeAVZHeaders: array [1..6] of String =
        ( 'Код'
          ,'Бюджетотримач'
          ,'Підрозділ'
          ,'Тип залишку'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
   

procedure TfrmENNormativeVolumeAVZShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENNormativeVolumeAVZShow:=nil;
    inherited;
  end;


procedure TfrmENNormativeVolumeAVZShow.FormShow(Sender: TObject);
var
  TempENNormativeVolumeAVZ: ENNormativeVolumeAVZControllerSoapPort;
  i: Integer;
  ENNormativeVolumeAVZList: ENNormativeVolumeAVZShortList;
begin
  SetGridHeaders(ENNormativeVolumeAVZHeaders, sgENNormativeVolumeAVZ.ColumnHeaders);
  ColCount:=100;
  TempENNormativeVolumeAVZ := HTTPRIOENNormativeVolumeAVZ as ENNormativeVolumeAVZControllerSoapPort;

  if FilterObject = nil then
  begin
    FilterObject := ENNormativeVolumeAVZFilter.Create;
    SetNullIntProps(FilterObject);
    SetNullXSProps(FilterObject);
  end;

  ENNormativeVolumeAVZList := TempENNormativeVolumeAVZ.getScrollableFilteredList(ENNormativeVolumeAVZFilter(FilterObject),0,ColCount);

  LastCount:=High(ENNormativeVolumeAVZList.list);

  if LastCount > -1 then
     sgENNormativeVolumeAVZ.RowCount:=LastCount+2
  else
     sgENNormativeVolumeAVZ.RowCount:=2;

   with sgENNormativeVolumeAVZ do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENNormativeVolumeAVZList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENNormativeVolumeAVZList.list[i].code)
        else
          Cells[0,i+1] := '';

        Cells[1,i+1] := ENNormativeVolumeAVZList.list[i].budgetRefShortName;
        Cells[2,i+1] := ENNormativeVolumeAVZList.list[i].departmentRefShortName;
        Cells[3,i+1] := ENNormativeVolumeAVZList.list[i].rest_purpose_type_name;
        Cells[4,i+1] := ENNormativeVolumeAVZList.list[i].userGen;

        if ENNormativeVolumeAVZList.list[i].dateEdit = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDateTimeWithDate2String(ENNormativeVolumeAVZList.list[i].dateEdit);
        LastRow:=i+1;
        sgENNormativeVolumeAVZ.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENNormativeVolumeAVZ.Row:=1;
end;

procedure TfrmENNormativeVolumeAVZShow.sgENNormativeVolumeAVZTopLeftChanged(Sender: TObject);
var
  TempENNormativeVolumeAVZ: ENNormativeVolumeAVZControllerSoapPort;
  i,CurrentRow: Integer;
  ENNormativeVolumeAVZList: ENNormativeVolumeAVZShortList;
begin
  if LastCount < 99 then Exit;
  if (sgENNormativeVolumeAVZ.TopRow + sgENNormativeVolumeAVZ.VisibleRowCount) = ColCount
  then
  begin
    TempENNormativeVolumeAVZ :=  HTTPRIOENNormativeVolumeAVZ as ENNormativeVolumeAVZControllerSoapPort;
    CurrentRow:=sgENNormativeVolumeAVZ.RowCount;

    if FilterObject = nil then
    begin
      FilterObject := ENNormativeVolumeAVZFilter.Create;
      SetNullIntProps(FilterObject);
      SetNullXSProps(FilterObject);
    end;

  ENNormativeVolumeAVZList := TempENNormativeVolumeAVZ.getScrollableFilteredList(ENNormativeVolumeAVZFilter(FilterObject),ColCount-1, 100);

  sgENNormativeVolumeAVZ.RowCount:=sgENNormativeVolumeAVZ.RowCount+100;
  LastCount:=High(ENNormativeVolumeAVZList.list);
  with sgENNormativeVolumeAVZ do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENNormativeVolumeAVZList.list[i].code <> Low(Integer) then
          Cells[0,i+CurrentRow] := IntToStr(ENNormativeVolumeAVZList.list[i].code)
        else
          Cells[0,i+CurrentRow] := '';


        Cells[1,i+CurrentRow] := ENNormativeVolumeAVZList.list[i].budgetRefShortName;
        Cells[2,i+CurrentRow] := ENNormativeVolumeAVZList.list[i].departmentRefShortName;
        Cells[3,i+CurrentRow] := ENNormativeVolumeAVZList.list[i].rest_purpose_type_name;
        Cells[4,i+CurrentRow] := ENNormativeVolumeAVZList.list[i].userGen;

        if ENNormativeVolumeAVZList.list[i].dateEdit = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := XSDateTimeWithDate2String(ENNormativeVolumeAVZList.list[i].dateEdit);
        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENNormativeVolumeAVZ.Row:=CurrentRow-5;
   sgENNormativeVolumeAVZ.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENNormativeVolumeAVZShow.sgENNormativeVolumeAVZDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENNormativeVolumeAVZ,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENNormativeVolumeAVZShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENNormativeVolumeAVZ.RowCount-1 do
   for j:=0 to sgENNormativeVolumeAVZ.ColCount-1 do
     sgENNormativeVolumeAVZ.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENNormativeVolumeAVZShow.actViewExecute(Sender: TObject);
Var TempENNormativeVolumeAVZ: ENNormativeVolumeAVZControllerSoapPort;
begin
  TempENNormativeVolumeAVZ := HTTPRIOENNormativeVolumeAVZ as ENNormativeVolumeAVZControllerSoapPort;
  try
    ENNormativeVolumeAVZObj := TempENNormativeVolumeAVZ.getObject(StrToInt(sgENNormativeVolumeAVZ.Cells[0,sgENNormativeVolumeAVZ.Row]));
  except
    on EConvertError do Exit;
  end;
  frmENNormativeVolumeAVZEdit:=TfrmENNormativeVolumeAVZEdit.Create(Application, dsView);
  try
    frmENNormativeVolumeAVZEdit.ShowModal;
  finally
    frmENNormativeVolumeAVZEdit.Free;
    frmENNormativeVolumeAVZEdit:=nil;
  end;
end;

procedure TfrmENNormativeVolumeAVZShow.actEditExecute(Sender: TObject);
Var TempENNormativeVolumeAVZ: ENNormativeVolumeAVZControllerSoapPort;
begin
  TempENNormativeVolumeAVZ := HTTPRIOENNormativeVolumeAVZ as ENNormativeVolumeAVZControllerSoapPort;
  try
    ENNormativeVolumeAVZObj := TempENNormativeVolumeAVZ.getObject(StrToInt(sgENNormativeVolumeAVZ.Cells[0,sgENNormativeVolumeAVZ.Row]));
  except
   on EConvertError do Exit;
  end;
  frmENNormativeVolumeAVZEdit:=TfrmENNormativeVolumeAVZEdit.Create(Application, dsEdit);
  try
    if frmENNormativeVolumeAVZEdit.ShowModal= mrOk then
      begin
        //TempENNormativeVolumeAVZ.save(ENNormativeVolumeAVZObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENNormativeVolumeAVZEdit.Free;
    frmENNormativeVolumeAVZEdit:=nil;
  end;
end;

procedure TfrmENNormativeVolumeAVZShow.actDeleteExecute(Sender: TObject);
Var TempENNormativeVolumeAVZ: ENNormativeVolumeAVZControllerSoapPort;
  ObjCode: Integer;
begin
  TempENNormativeVolumeAVZ := HTTPRIOENNormativeVolumeAVZ as ENNormativeVolumeAVZControllerSoapPort;
  try
    ObjCode := StrToInt(sgENNormativeVolumeAVZ.Cells[0,sgENNormativeVolumeAVZ.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Довідник нормативних обсягів АВЗ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENNormativeVolumeAVZ.remove(ObjCode);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENNormativeVolumeAVZShow.actInsertExecute(Sender: TObject);
begin
  ENNormativeVolumeAVZObj:=ENNormativeVolumeAVZ.Create;
  try
    frmENNormativeVolumeAVZEdit := TfrmENNormativeVolumeAVZEdit.Create(Application, dsInsert);
    try
      if frmENNormativeVolumeAVZEdit.ShowModal = mrOk then
      begin
        if ENNormativeVolumeAVZObj<>nil then
          UpdateGrid(Sender);
      end;
    finally
      frmENNormativeVolumeAVZEdit.Free;
      frmENNormativeVolumeAVZEdit:=nil;
    end;
  finally
    ENNormativeVolumeAVZObj.Free;
  end;
end;


procedure TfrmENNormativeVolumeAVZShow.actUpdateExecute(Sender: TObject);
begin
  UpdateGrid(Sender);
end;


procedure TfrmENNormativeVolumeAVZShow.actFilterExecute(Sender: TObject);
begin
  frmENNormativeVolumeAVZFilterEdit:=TfrmENNormativeVolumeAVZFilterEdit.Create(Application, dsInsert);
  try
    ENNormativeVolumeAVZFilterObj := ENNormativeVolumeAVZFilter.Create;
    SetNullIntProps(ENNormativeVolumeAVZFilterObj);
    SetNullXSProps(ENNormativeVolumeAVZFilterObj);

    if frmENNormativeVolumeAVZFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENNormativeVolumeAVZFilter.Create;
      FilterObject := ENNormativeVolumeAVZFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENNormativeVolumeAVZFilterEdit.Free;
    frmENNormativeVolumeAVZFilterEdit:=nil;
  end;
end;

procedure TfrmENNormativeVolumeAVZShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.