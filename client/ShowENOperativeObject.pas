
unit ShowENOperativeObject;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENOperativeObjectController ;


type
  TfrmENOperativeObjectShow = class(TChildForm)  
  HTTPRIOENOperativeObject: THTTPRIO;
    ImageList1: TImageList;
    sgENOperativeObject: TAdvStringGrid;
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
procedure sgENOperativeObjectTopLeftChanged(Sender: TObject);
procedure sgENOperativeObjectDblClick(Sender: TObject);
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
 // ENOperativeObjectObj: ENOperativeObject;
 // ENOperativeObjectFilterObj: ENOperativeObjectFilter;
  
  
implementation

uses Main, EditENOperativeObject, EditENOperativeObjectFilter;


{$R *.dfm}

var
  //frmENOperativeObjectShow : TfrmENOperativeObjectShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENOperativeObjectHeaders: array [1..6] of String =
        ( 'Код'
          ,'№ договору'
          ,'Дата договору'
          ,'Контрагент'
          ,'Назва'
          ,'Підрозділ'
        );
   

procedure TfrmENOperativeObjectShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENOperativeObjectShow := nil;
  inherited;
end;


procedure TfrmENOperativeObjectShow.FormShow(Sender: TObject);
var
  TempENOperativeObject: ENOperativeObjectControllerSoapPort;
  i: Integer;
  ENOperativeObjectList: ENOperativeObjectShortList;
begin
  SetGridHeaders(ENOperativeObjectHeaders, sgENOperativeObject.ColumnHeaders);
  ColCount := 100;
  TempENOperativeObject := HTTPRIOENOperativeObject as ENOperativeObjectControllerSoapPort;

  if FilterObject = nil then
  begin
    FilterObject := ENOperativeObjectFilter.Create;
    SetNullIntProps(FilterObject);
    SetNullXSProps(FilterObject);
  end;

  ENOperativeObjectList := TempENOperativeObject.getScrollableFilteredList(ENOperativeObjectFilter(FilterObject), 0, ColCount);

  LastCount := High(ENOperativeObjectList.list);

  if LastCount > -1 then
     sgENOperativeObject.RowCount := LastCount + 2
  else
     sgENOperativeObject.RowCount := 2;

  with sgENOperativeObject do
    for i := 0 to LastCount do
    begin
      Application.ProcessMessages;

      if ENOperativeObjectList.list[i].code <> Low(Integer) then
        Cells[0, i + 1] := IntToStr(ENOperativeObjectList.list[i].code)
      else
        Cells[0, i + 1] := '';
      Cells[1, i + 1] := ENOperativeObjectList.list[i].contractNumber;
      if ENOperativeObjectList.list[i].contractDate = nil then
        Cells[2, i + 1] := ''
      else
        Cells[2, i + 1] := XSDate2String(ENOperativeObjectList.list[i].contractDate);
      Cells[3, i + 1] := ENOperativeObjectList.list[i].partnerName;
      Cells[4, i + 1] := ENOperativeObjectList.list[i].name;
      Cells[5, i + 1] := ENOperativeObjectList.list[i].departmentShortName;

      LastRow := i + 1;
      sgENOperativeObject.RowCount := LastRow + 1;
    end;

  ColCount := ColCount + 1;
  sgENOperativeObject.Row := 1;
end;

procedure TfrmENOperativeObjectShow.sgENOperativeObjectTopLeftChanged(Sender: TObject);
var
  TempENOperativeObject: ENOperativeObjectControllerSoapPort;
  i, CurrentRow: Integer;
  ENOperativeObjectList: ENOperativeObjectShortList;
begin
  if LastCount < 99 then Exit;

  if (sgENOperativeObject.TopRow + sgENOperativeObject.VisibleRowCount) = ColCount then
  begin
    TempENOperativeObject := HTTPRIOENOperativeObject as ENOperativeObjectControllerSoapPort;
    CurrentRow := sgENOperativeObject.RowCount;

    if FilterObject = nil then
    begin
      FilterObject := ENOperativeObjectFilter.Create;
      SetNullIntProps(FilterObject);
      SetNullXSProps(FilterObject);
    end;

    ENOperativeObjectList := TempENOperativeObject.getScrollableFilteredList(ENOperativeObjectFilter(FilterObject), ColCount - 1, 100);

    sgENOperativeObject.RowCount := sgENOperativeObject.RowCount + 100;

    LastCount := High(ENOperativeObjectList.list);

    with sgENOperativeObject do
      for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if ENOperativeObjectList.list[i].code <> Low(Integer) then
          Cells[0, i + CurrentRow] := IntToStr(ENOperativeObjectList.list[i].code)
        else
          Cells[0, i + CurrentRow] := '';
        Cells[1, i + CurrentRow] := ENOperativeObjectList.list[i].contractNumber;
        if ENOperativeObjectList.list[i].contractDate = nil then
          Cells[2, i + CurrentRow] := ''
        else
          Cells[2, i + CurrentRow] := XSDate2String(ENOperativeObjectList.list[i].contractDate);
        Cells[3, i + CurrentRow] := ENOperativeObjectList.list[i].partnerName;
        Cells[4, i + CurrentRow] := ENOperativeObjectList.list[i].name;
        Cells[5, i + CurrentRow] := ENOperativeObjectList.list[i].departmentShortName;

        LastRow := i + CurrentRow;
      end;

      ColCount := ColCount + 100;
      sgENOperativeObject.Row := CurrentRow - 5;
      sgENOperativeObject.RowCount := LastRow + 1;
  end;
end;

procedure TfrmENOperativeObjectShow.sgENOperativeObjectDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENOperativeObject,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENOperativeObjectShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENOperativeObject.RowCount-1 do
   for j:=0 to sgENOperativeObject.ColCount-1 do
     sgENOperativeObject.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENOperativeObjectShow.actViewExecute(Sender: TObject);
Var TempENOperativeObject: ENOperativeObjectControllerSoapPort;
begin
 TempENOperativeObject := HTTPRIOENOperativeObject as ENOperativeObjectControllerSoapPort;
   try
     ENOperativeObjectObj := TempENOperativeObject.getObject(StrToInt(sgENOperativeObject.Cells[0,sgENOperativeObject.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENOperativeObjectEdit:=TfrmENOperativeObjectEdit.Create(Application, dsView);
  try
    frmENOperativeObjectEdit.ShowModal;
  finally
    frmENOperativeObjectEdit.Free;
    frmENOperativeObjectEdit:=nil;
  end;
end;

procedure TfrmENOperativeObjectShow.actEditExecute(Sender: TObject);
Var TempENOperativeObject: ENOperativeObjectControllerSoapPort;
begin
 TempENOperativeObject := HTTPRIOENOperativeObject as ENOperativeObjectControllerSoapPort;
   try
     ENOperativeObjectObj := TempENOperativeObject.getObject(StrToInt(sgENOperativeObject.Cells[0,sgENOperativeObject.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENOperativeObjectEdit:=TfrmENOperativeObjectEdit.Create(Application, dsEdit);
  try
    if frmENOperativeObjectEdit.ShowModal= mrOk then
      begin
        //TempENOperativeObject.save(ENOperativeObjectObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENOperativeObjectEdit.Free;
    frmENOperativeObjectEdit:=nil;
  end;
end;

procedure TfrmENOperativeObjectShow.actDeleteExecute(Sender: TObject);
Var TempENOperativeObject: ENOperativeObjectControllerSoapPort;
  ObjCode: Integer;
begin
 TempENOperativeObject := HTTPRIOENOperativeObject as ENOperativeObjectControllerSoapPort;
   try
     ObjCode := StrToInt(sgENOperativeObject.Cells[0,sgENOperativeObject.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити об''єкт?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENOperativeObject.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENOperativeObjectShow.actInsertExecute(Sender: TObject);
Var TempENOperativeObject: ENOperativeObjectControllerSoapPort;
begin
  TempENOperativeObject := HTTPRIOENOperativeObject as ENOperativeObjectControllerSoapPort;
  ENOperativeObjectObj:=ENOperativeObject.Create;



  try
    frmENOperativeObjectEdit:=TfrmENOperativeObjectEdit.Create(Application, dsInsert);
    try
      if frmENOperativeObjectEdit.ShowModal = mrOk then
      begin
        if ENOperativeObjectObj<>nil then
            //TempENOperativeObject.add(ENOperativeObjectObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENOperativeObjectEdit.Free;
      frmENOperativeObjectEdit:=nil;
    end;
  finally
    ENOperativeObjectObj.Free;
  end;
end;

procedure TfrmENOperativeObjectShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENOperativeObjectShow.actFilterExecute(Sender: TObject);
begin
  frmENOperativeObjectFilterEdit:=TfrmENOperativeObjectFilterEdit.Create(Application, dsInsert);
  try
    ENOperativeObjectFilterObj := ENOperativeObjectFilter.Create;
    SetNullIntProps(ENOperativeObjectFilterObj);
    SetNullXSProps(ENOperativeObjectFilterObj);

    if frmENOperativeObjectFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENOperativeObjectFilter.Create;
      FilterObject := ENOperativeObjectFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENOperativeObjectFilterEdit.Free;
    frmENOperativeObjectFilterEdit:=nil;
  end;
end;

procedure TfrmENOperativeObjectShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.