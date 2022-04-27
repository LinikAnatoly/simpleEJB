
unit ShowENFuelInvResult;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENFuelInvResultController, AdvObj ;


type
  TfrmENFuelInvResultShow = class(TChildForm)  
  HTTPRIOENFuelInvResult: THTTPRIO;
    ImageList1: TImageList;
    sgENFuelInvResult: TAdvStringGrid;
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
procedure sgENFuelInvResultTopLeftChanged(Sender: TObject);
procedure sgENFuelInvResultDblClick(Sender: TObject);
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
 // ENFuelInvResultObj: ENFuelInvResult;
 // ENFuelInvResultFilterObj: ENFuelInvResultFilter;
  
  
implementation

uses Main, EditENFuelInvResult, EditENFuelInvResultFilter;


{$R *.dfm}

var
  //frmENFuelInvResultShow : TfrmENFuelInvResultShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENFuelInvResultHeaders: array [1..4] of String =
        ( 'Код'
          ,'обсяг(абс.знач.), л.'
          ,'Користувач, який змінив'
          ,'Дата зміни'
        );
   

procedure TfrmENFuelInvResultShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENFuelInvResultShow:=nil;
    inherited;
  end;


procedure TfrmENFuelInvResultShow.FormShow(Sender: TObject);
var
  TempENFuelInvResult: ENFuelInvResultControllerSoapPort;
  i: Integer;
  ENFuelInvResultList: ENFuelInvResultShortList;
  begin
  SetGridHeaders(ENFuelInvResultHeaders, sgENFuelInvResult.ColumnHeaders);
  ColCount:=100;
  TempENFuelInvResult :=  HTTPRIOENFuelInvResult as ENFuelInvResultControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENFuelInvResultFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENFuelInvResultList := TempENFuelInvResult.getScrollableFilteredList(ENFuelInvResultFilter(FilterObject),0,ColCount);


  LastCount:=High(ENFuelInvResultList.list);

  if LastCount > -1 then
     sgENFuelInvResult.RowCount:=LastCount+2
  else
     sgENFuelInvResult.RowCount:=2;

   with sgENFuelInvResult do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENFuelInvResultList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENFuelInvResultList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENFuelInvResultList.list[i].deltaCount = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := ENFuelInvResultList.list[i].deltaCount.DecimalString;
        Cells[2,i+1] := ENFuelInvResultList.list[i].userGen;
        if ENFuelInvResultList.list[i].dateEdit = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDateTimeWithDate2String(ENFuelInvResultList.list[i].dateEdit);
        LastRow:=i+1;
        sgENFuelInvResult.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENFuelInvResult.Row:=1;
end;

procedure TfrmENFuelInvResultShow.sgENFuelInvResultTopLeftChanged(Sender: TObject);
var
  TempENFuelInvResult: ENFuelInvResultControllerSoapPort;
  i,CurrentRow: Integer;
  ENFuelInvResultList: ENFuelInvResultShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENFuelInvResult.TopRow + sgENFuelInvResult.VisibleRowCount) = ColCount
  then
    begin
      TempENFuelInvResult :=  HTTPRIOENFuelInvResult as ENFuelInvResultControllerSoapPort;
      CurrentRow:=sgENFuelInvResult.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENFuelInvResultFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENFuelInvResultList := TempENFuelInvResult.getScrollableFilteredList(ENFuelInvResultFilter(FilterObject),ColCount-1, 100);



  sgENFuelInvResult.RowCount:=sgENFuelInvResult.RowCount+100;
  LastCount:=High(ENFuelInvResultList.list);
  with sgENFuelInvResult do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENFuelInvResultList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENFuelInvResultList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENFuelInvResultList.list[i].deltaCount = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := ENFuelInvResultList.list[i].deltaCount.DecimalString;
        Cells[2,i+CurrentRow] := ENFuelInvResultList.list[i].userGen;
        if ENFuelInvResultList.list[i].dateEdit = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDateTimeWithDate2String(ENFuelInvResultList.list[i].dateEdit);		  
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENFuelInvResult.Row:=CurrentRow-5;
   sgENFuelInvResult.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENFuelInvResultShow.sgENFuelInvResultDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENFuelInvResult,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENFuelInvResultShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENFuelInvResult.RowCount-1 do
   for j:=0 to sgENFuelInvResult.ColCount-1 do
     sgENFuelInvResult.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENFuelInvResultShow.actViewExecute(Sender: TObject);
Var TempENFuelInvResult: ENFuelInvResultControllerSoapPort;
begin
 TempENFuelInvResult := HTTPRIOENFuelInvResult as ENFuelInvResultControllerSoapPort;
   try
     ENFuelInvResultObj := TempENFuelInvResult.getObject(StrToInt(sgENFuelInvResult.Cells[0,sgENFuelInvResult.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENFuelInvResultEdit:=TfrmENFuelInvResultEdit.Create(Application, dsView);
  try
    frmENFuelInvResultEdit.ShowModal;
  finally
    frmENFuelInvResultEdit.Free;
    frmENFuelInvResultEdit:=nil;
  end;
end;

procedure TfrmENFuelInvResultShow.actEditExecute(Sender: TObject);
Var TempENFuelInvResult: ENFuelInvResultControllerSoapPort;
begin
 TempENFuelInvResult := HTTPRIOENFuelInvResult as ENFuelInvResultControllerSoapPort;
   try
     ENFuelInvResultObj := TempENFuelInvResult.getObject(StrToInt(sgENFuelInvResult.Cells[0,sgENFuelInvResult.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENFuelInvResultEdit:=TfrmENFuelInvResultEdit.Create(Application, dsEdit);
  try
    if frmENFuelInvResultEdit.ShowModal= mrOk then
      begin
        //TempENFuelInvResult.save(ENFuelInvResultObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENFuelInvResultEdit.Free;
    frmENFuelInvResultEdit:=nil;
  end;
end;

procedure TfrmENFuelInvResultShow.actDeleteExecute(Sender: TObject);
Var TempENFuelInvResult: ENFuelInvResultControllerSoapPort;
  ObjCode: Integer;
begin
 TempENFuelInvResult := HTTPRIOENFuelInvResult as ENFuelInvResultControllerSoapPort;
   try
     ObjCode := StrToInt(sgENFuelInvResult.Cells[0,sgENFuelInvResult.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Результат інвентарізації палива) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENFuelInvResult.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENFuelInvResultShow.actInsertExecute(Sender: TObject);
// Var TempENFuelInvResult: ENFuelInvResultControllerSoapPort; 
begin
  // TempENFuelInvResult := HTTPRIOENFuelInvResult as ENFuelInvResultControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENFuelInvResultObj:=ENFuelInvResult.Create;

   //ENFuelInvResultObj.deltaCount:= TXSDecimal.Create;
   //ENFuelInvResultObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENFuelInvResultEdit:=TfrmENFuelInvResultEdit.Create(Application, dsInsert);
    try
      if frmENFuelInvResultEdit.ShowModal = mrOk then
      begin
        if ENFuelInvResultObj<>nil then
            //TempENFuelInvResult.add(ENFuelInvResultObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENFuelInvResultEdit.Free;
      frmENFuelInvResultEdit:=nil;
    end;
  finally
    ENFuelInvResultObj.Free;
  end;
end;

procedure TfrmENFuelInvResultShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENFuelInvResultShow.actFilterExecute(Sender: TObject);
begin
{frmENFuelInvResultFilterEdit:=TfrmENFuelInvResultFilterEdit.Create(Application, dsInsert);
  try
    ENFuelInvResultFilterObj := ENFuelInvResultFilter.Create;
    SetNullIntProps(ENFuelInvResultFilterObj);
    SetNullXSProps(ENFuelInvResultFilterObj);

    if frmENFuelInvResultFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENFuelInvResultFilter.Create;
      FilterObject := ENFuelInvResultFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENFuelInvResultFilterEdit.Free;
    frmENFuelInvResultFilterEdit:=nil;
  end;}
end;

procedure TfrmENFuelInvResultShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.