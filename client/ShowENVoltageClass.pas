
unit ShowENVoltageClass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENVoltageClassController, AdvObj ;


type
  TfrmENVoltageClassShow = class(TChildForm)  
  HTTPRIOENVoltageClass: THTTPRIO;
    ImageList1: TImageList;
    sgENVoltageClass: TAdvStringGrid;
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
procedure sgENVoltageClassTopLeftChanged(Sender: TObject);
procedure sgENVoltageClassDblClick(Sender: TObject);
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

var
 frmENVoltageClassShow : TfrmENVoltageClassShow;
 // ENVoltageClassObj: ENVoltageClass;
 // ENVoltageClassFilterObj: ENVoltageClassFilter;
  
  
implementation

uses Main, EditENVoltageClass, EditENVoltageClassFilter;


{$R *.dfm}

var
  //frmENVoltageClassShow : TfrmENVoltageClassShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENVoltageClassHeaders: array [1..3] of String =
        ( 'Код'
          ,'Напряжение, кВ'
          ,'Описание'
        );
   

procedure TfrmENVoltageClassShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENVoltageClassShow:=nil;
    inherited;
  end;


procedure TfrmENVoltageClassShow.FormShow(Sender: TObject);
var
  TempENVoltageClass: ENVoltageClassControllerSoapPort;
  i: Integer;
  ENVoltageClassList: ENVoltageClassShortList;
  begin
  SetGridHeaders(ENVoltageClassHeaders, sgENVoltageClass.ColumnHeaders);
  ColCount:=100;
  TempENVoltageClass :=  HTTPRIOENVoltageClass as ENVoltageClassControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENVoltageClassFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENVoltageClassList := TempENVoltageClass.getScrollableFilteredList(ENVoltageClassFilter(FilterObject),0,ColCount);


  LastCount:=High(ENVoltageClassList.list);

  if LastCount > -1 then
     sgENVoltageClass.RowCount:=LastCount+2
  else
     sgENVoltageClass.RowCount:=2;

   with sgENVoltageClass do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENVoltageClassList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENVoltageClassList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENVoltageClassList.list[i].value = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := ENVoltageClassList.list[i].value.DecimalString;
        Cells[2,i+1] := ENVoltageClassList.list[i].description;
        LastRow:=i+1;
        sgENVoltageClass.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENVoltageClass.Row:=1;
end;

procedure TfrmENVoltageClassShow.sgENVoltageClassTopLeftChanged(Sender: TObject);
var
  TempENVoltageClass: ENVoltageClassControllerSoapPort;
  i,CurrentRow: Integer;
  ENVoltageClassList: ENVoltageClassShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENVoltageClass.TopRow + sgENVoltageClass.VisibleRowCount) = ColCount
  then
    begin
      TempENVoltageClass :=  HTTPRIOENVoltageClass as ENVoltageClassControllerSoapPort;
      CurrentRow:=sgENVoltageClass.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENVoltageClassFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENVoltageClassList := TempENVoltageClass.getScrollableFilteredList(ENVoltageClassFilter(FilterObject),ColCount-1, 100);



  sgENVoltageClass.RowCount:=sgENVoltageClass.RowCount+100;
  LastCount:=High(ENVoltageClassList.list);
  with sgENVoltageClass do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENVoltageClassList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENVoltageClassList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENVoltageClassList.list[i].value = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := ENVoltageClassList.list[i].value.DecimalString;
        Cells[2,i+CurrentRow] := ENVoltageClassList.list[i].description;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENVoltageClass.Row:=CurrentRow-5;
   sgENVoltageClass.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENVoltageClassShow.sgENVoltageClassDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENVoltageClass,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENVoltageClassShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENVoltageClass.RowCount-1 do
   for j:=0 to sgENVoltageClass.ColCount-1 do
     sgENVoltageClass.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENVoltageClassShow.actViewExecute(Sender: TObject);
Var TempENVoltageClass: ENVoltageClassControllerSoapPort;
begin
 TempENVoltageClass := HTTPRIOENVoltageClass as ENVoltageClassControllerSoapPort;
   try
     ENVoltageClassObj := TempENVoltageClass.getObject(StrToInt(sgENVoltageClass.Cells[0,sgENVoltageClass.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENVoltageClassEdit:=TfrmENVoltageClassEdit.Create(Application, dsView);
  try
    frmENVoltageClassEdit.ShowModal;
  finally
    frmENVoltageClassEdit.Free;
    frmENVoltageClassEdit:=nil;
  end;
end;

procedure TfrmENVoltageClassShow.actEditExecute(Sender: TObject);
Var TempENVoltageClass: ENVoltageClassControllerSoapPort;
begin
 TempENVoltageClass := HTTPRIOENVoltageClass as ENVoltageClassControllerSoapPort;
   try
     ENVoltageClassObj := TempENVoltageClass.getObject(StrToInt(sgENVoltageClass.Cells[0,sgENVoltageClass.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENVoltageClassEdit:=TfrmENVoltageClassEdit.Create(Application, dsEdit);
  try
    if frmENVoltageClassEdit.ShowModal= mrOk then
      begin
        //TempENVoltageClass.save(ENVoltageClassObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENVoltageClassEdit.Free;
    frmENVoltageClassEdit:=nil;
  end;
end;

procedure TfrmENVoltageClassShow.actDeleteExecute(Sender: TObject);
Var TempENVoltageClass: ENVoltageClassControllerSoapPort;
  ObjCode: Integer;
begin
 TempENVoltageClass := HTTPRIOENVoltageClass as ENVoltageClassControllerSoapPort;
   try
     ObjCode := StrToInt(sgENVoltageClass.Cells[0,sgENVoltageClass.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Классы напряжений) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENVoltageClass.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENVoltageClassShow.actInsertExecute(Sender: TObject);
// Var TempENVoltageClass: ENVoltageClassControllerSoapPort; 
begin
  // TempENVoltageClass := HTTPRIOENVoltageClass as ENVoltageClassControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENVoltageClassObj:=ENVoltageClass.Create;

   //ENVoltageClassObj.value:= TXSDecimal.Create;


  try
    frmENVoltageClassEdit:=TfrmENVoltageClassEdit.Create(Application, dsInsert);
    try
      if frmENVoltageClassEdit.ShowModal = mrOk then
      begin
        if ENVoltageClassObj<>nil then
            //TempENVoltageClass.add(ENVoltageClassObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENVoltageClassEdit.Free;
      frmENVoltageClassEdit:=nil;
    end;
  finally
    ENVoltageClassObj.Free;
  end;
end;

procedure TfrmENVoltageClassShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENVoltageClassShow.actFilterExecute(Sender: TObject);
begin
{frmENVoltageClassFilterEdit:=TfrmENVoltageClassFilterEdit.Create(Application, dsInsert);
  try
    ENVoltageClassFilterObj := ENVoltageClassFilter.Create;
    SetNullIntProps(ENVoltageClassFilterObj);
    SetNullXSProps(ENVoltageClassFilterObj);

    if frmENVoltageClassFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENVoltageClassFilter.Create;
      FilterObject := ENVoltageClassFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENVoltageClassFilterEdit.Free;
    frmENVoltageClassFilterEdit:=nil;
  end;}
end;

procedure TfrmENVoltageClassShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.