
unit ShowENActFailure;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENActFailureController ;


type
  TfrmENActFailureShow = class(TChildForm)  
  HTTPRIOENActFailure: THTTPRIO;
    ImageList1: TImageList;
    sgENActFailure: TAdvStringGrid;
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
procedure sgENActFailureTopLeftChanged(Sender: TObject);
procedure sgENActFailureDblClick(Sender: TObject);
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
 // ENActFailureObj: ENActFailure;
 // ENActFailureFilterObj: ENActFailureFilter;
  
  
implementation

uses Main, EditENActFailure, EditENActFailureFilter;


{$R *.dfm}

var
  //frmENActFailureShow : TfrmENActFailureShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENActFailureHeaders: array [1..8] of String =
        ( 'Код'
          ,'Номер акта'
          ,'Дата акту'
          ,'Коментар '
          ,'Користувач, що додав акт'
          ,'Дата додавання'
          ,'Користувач, який змінив акт'
          ,'Дата зміни'
        );
   

procedure TfrmENActFailureShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENActFailureShow:=nil;
    inherited;
  end;


procedure TfrmENActFailureShow.FormShow(Sender: TObject);
var
  TempENActFailure: ENActFailureControllerSoapPort;
  i: Integer;
  ENActFailureList: ENActFailureShortList;
  begin
  SetGridHeaders(ENActFailureHeaders, sgENActFailure.ColumnHeaders);
  ColCount:=100;
  TempENActFailure :=  HTTPRIOENActFailure as ENActFailureControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENActFailureFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENActFailureList := TempENActFailure.getScrollableFilteredList(ENActFailureFilter(FilterObject),0,ColCount);


  LastCount:=High(ENActFailureList.list);

  if LastCount > -1 then
     sgENActFailure.RowCount:=LastCount+2
  else
     sgENActFailure.RowCount:=2;

   with sgENActFailure do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENActFailureList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENActFailureList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENActFailureList.list[i].numberGen;
        if ENActFailureList.list[i].dateAct = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDateTimeWithDate2String(ENActFailureList.list[i].dateAct);
        Cells[3,i+1] := ENActFailureList.list[i].commentGen;
        Cells[4,i+1] := ENActFailureList.list[i].userAdd;
        if ENActFailureList.list[i].dateAdd = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDateTimeWithDate2String(ENActFailureList.list[i].dateAdd);
        Cells[6,i+1] := ENActFailureList.list[i].userGen;
        if ENActFailureList.list[i].dateEdit = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := XSDateTimeWithDate2String(ENActFailureList.list[i].dateEdit);
        LastRow:=i+1;
        sgENActFailure.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENActFailure.Row:=1;
end;

procedure TfrmENActFailureShow.sgENActFailureTopLeftChanged(Sender: TObject);
var
  TempENActFailure: ENActFailureControllerSoapPort;
  i,CurrentRow: Integer;
  ENActFailureList: ENActFailureShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENActFailure.TopRow + sgENActFailure.VisibleRowCount) = ColCount
  then
    begin
      TempENActFailure :=  HTTPRIOENActFailure as ENActFailureControllerSoapPort;
      CurrentRow:=sgENActFailure.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENActFailureFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENActFailureList := TempENActFailure.getScrollableFilteredList(ENActFailureFilter(FilterObject),ColCount-1, 100);



  sgENActFailure.RowCount:=sgENActFailure.RowCount+100;
  LastCount:=High(ENActFailureList.list);
  with sgENActFailure do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENActFailureList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENActFailureList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENActFailureList.list[i].numberGen;
        if ENActFailureList.list[i].dateAct = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDateTimeWithDate2String(ENActFailureList.list[i].dateAct);		  
        Cells[3,i+CurrentRow] := ENActFailureList.list[i].commentGen;
        Cells[4,i+CurrentRow] := ENActFailureList.list[i].userAdd;
        if ENActFailureList.list[i].dateAdd = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := XSDateTimeWithDate2String(ENActFailureList.list[i].dateAdd);		  
        Cells[6,i+CurrentRow] := ENActFailureList.list[i].userGen;
        if ENActFailureList.list[i].dateEdit = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := XSDateTimeWithDate2String(ENActFailureList.list[i].dateEdit);		  
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENActFailure.Row:=CurrentRow-5;
   sgENActFailure.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENActFailureShow.sgENActFailureDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENActFailure,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENActFailureShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENActFailure.RowCount-1 do
   for j:=0 to sgENActFailure.ColCount-1 do
     sgENActFailure.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENActFailureShow.actViewExecute(Sender: TObject);
Var TempENActFailure: ENActFailureControllerSoapPort;
begin
 TempENActFailure := HTTPRIOENActFailure as ENActFailureControllerSoapPort;
   try
     ENActFailureObj := TempENActFailure.getObject(StrToInt(sgENActFailure.Cells[0,sgENActFailure.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENActFailureEdit:=TfrmENActFailureEdit.Create(Application, dsView);
  try
    frmENActFailureEdit.ShowModal;
  finally
    frmENActFailureEdit.Free;
    frmENActFailureEdit:=nil;
  end;
end;

procedure TfrmENActFailureShow.actEditExecute(Sender: TObject);
Var TempENActFailure: ENActFailureControllerSoapPort;
begin
 TempENActFailure := HTTPRIOENActFailure as ENActFailureControllerSoapPort;
   try
     ENActFailureObj := TempENActFailure.getObject(StrToInt(sgENActFailure.Cells[0,sgENActFailure.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENActFailureEdit:=TfrmENActFailureEdit.Create(Application, dsEdit);
  try
    if frmENActFailureEdit.ShowModal= mrOk then
      begin
        //TempENActFailure.save(ENActFailureObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENActFailureEdit.Free;
    frmENActFailureEdit:=nil;
  end;
end;

procedure TfrmENActFailureShow.actDeleteExecute(Sender: TObject);
Var TempENActFailure: ENActFailureControllerSoapPort;
  ObjCode: Integer;
begin
 TempENActFailure := HTTPRIOENActFailure as ENActFailureControllerSoapPort;
   try
     ObjCode := StrToInt(sgENActFailure.Cells[0,sgENActFailure.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Акти невиконання) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENActFailure.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENActFailureShow.actInsertExecute(Sender: TObject);
// Var TempENActFailure: ENActFailureControllerSoapPort; 
begin
  // TempENActFailure := HTTPRIOENActFailure as ENActFailureControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENActFailureObj:=ENActFailure.Create;

   //ENActFailureObj.dateAct:= TXSDateTime.Create;
   
   //ENActFailureObj.dateAdd:= TXSDateTime.Create;
   
   //ENActFailureObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENActFailureEdit:=TfrmENActFailureEdit.Create(Application, dsInsert);
    try
      if frmENActFailureEdit.ShowModal = mrOk then
      begin
        if ENActFailureObj<>nil then
            //TempENActFailure.add(ENActFailureObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENActFailureEdit.Free;
      frmENActFailureEdit:=nil;
    end;
  finally
    ENActFailureObj.Free;
  end;
end;

procedure TfrmENActFailureShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENActFailureShow.actFilterExecute(Sender: TObject);
begin
{frmENActFailureFilterEdit:=TfrmENActFailureFilterEdit.Create(Application, dsInsert);
  try
    ENActFailureFilterObj := ENActFailureFilter.Create;
    SetNullIntProps(ENActFailureFilterObj);
    SetNullXSProps(ENActFailureFilterObj);

    if frmENActFailureFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENActFailureFilter.Create;
      FilterObject := ENActFailureFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENActFailureFilterEdit.Free;
    frmENActFailureFilterEdit:=nil;
  end;}
end;

procedure TfrmENActFailureShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.