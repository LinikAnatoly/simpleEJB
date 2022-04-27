
unit ShowENDamageRecovery2ENAct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENDamageRecovery2ENActController, AdvObj ;


type
  TfrmENDamageRecovery2ENActShow = class(TChildForm)  
  HTTPRIOENDamageRecovery2ENAct: THTTPRIO;
    ImageList1: TImageList;
    sgENDamageRecovery2ENAct: TAdvStringGrid;
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
procedure sgENDamageRecovery2ENActTopLeftChanged(Sender: TObject);
procedure sgENDamageRecovery2ENActDblClick(Sender: TObject);
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
 // ENDamageRecovery2ENActObj: ENDamageRecovery2ENAct;
 // ENDamageRecovery2ENActFilterObj: ENDamageRecovery2ENActFilter;
  
  
implementation

uses Main, EditENDamageRecovery2ENAct, EditENDamageRecovery2ENActFilter;


{$R *.dfm}

var
  //frmENDamageRecovery2ENActShow : TfrmENDamageRecovery2ENActShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENDamageRecovery2ENActHeaders: array [1..3] of String =
        ( 'Код'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
   

procedure TfrmENDamageRecovery2ENActShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENDamageRecovery2ENActShow:=nil;
    inherited;
  end;


procedure TfrmENDamageRecovery2ENActShow.FormShow(Sender: TObject);
var
  TempENDamageRecovery2ENAct: ENDamageRecovery2ENActControllerSoapPort;
  i: Integer;
  ENDamageRecovery2ENActList: ENDamageRecovery2ENActShortList;
  begin
  SetGridHeaders(ENDamageRecovery2ENActHeaders, sgENDamageRecovery2ENAct.ColumnHeaders);
  ColCount:=100;
  TempENDamageRecovery2ENAct :=  HTTPRIOENDamageRecovery2ENAct as ENDamageRecovery2ENActControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENDamageRecovery2ENActFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDamageRecovery2ENActList := TempENDamageRecovery2ENAct.getScrollableFilteredList(ENDamageRecovery2ENActFilter(FilterObject),0,ColCount);


  LastCount:=High(ENDamageRecovery2ENActList.list);

  if LastCount > -1 then
     sgENDamageRecovery2ENAct.RowCount:=LastCount+2
  else
     sgENDamageRecovery2ENAct.RowCount:=2;

   with sgENDamageRecovery2ENAct do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDamageRecovery2ENActList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENDamageRecovery2ENActList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENDamageRecovery2ENActList.list[i].userGen;
        if ENDamageRecovery2ENActList.list[i].dateEdit = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDateTimeWithDate2String(ENDamageRecovery2ENActList.list[i].dateEdit);
        LastRow:=i+1;
        sgENDamageRecovery2ENAct.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENDamageRecovery2ENAct.Row:=1;
end;

procedure TfrmENDamageRecovery2ENActShow.sgENDamageRecovery2ENActTopLeftChanged(Sender: TObject);
var
  TempENDamageRecovery2ENAct: ENDamageRecovery2ENActControllerSoapPort;
  i,CurrentRow: Integer;
  ENDamageRecovery2ENActList: ENDamageRecovery2ENActShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENDamageRecovery2ENAct.TopRow + sgENDamageRecovery2ENAct.VisibleRowCount) = ColCount
  then
    begin
      TempENDamageRecovery2ENAct :=  HTTPRIOENDamageRecovery2ENAct as ENDamageRecovery2ENActControllerSoapPort;
      CurrentRow:=sgENDamageRecovery2ENAct.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENDamageRecovery2ENActFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDamageRecovery2ENActList := TempENDamageRecovery2ENAct.getScrollableFilteredList(ENDamageRecovery2ENActFilter(FilterObject),ColCount-1, 100);



  sgENDamageRecovery2ENAct.RowCount:=sgENDamageRecovery2ENAct.RowCount+100;
  LastCount:=High(ENDamageRecovery2ENActList.list);
  with sgENDamageRecovery2ENAct do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDamageRecovery2ENActList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENDamageRecovery2ENActList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENDamageRecovery2ENActList.list[i].userGen;
        if ENDamageRecovery2ENActList.list[i].dateEdit = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDateTimeWithDate2String(ENDamageRecovery2ENActList.list[i].dateEdit);		  
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENDamageRecovery2ENAct.Row:=CurrentRow-5;
   sgENDamageRecovery2ENAct.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENDamageRecovery2ENActShow.sgENDamageRecovery2ENActDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENDamageRecovery2ENAct,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENDamageRecovery2ENActShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENDamageRecovery2ENAct.RowCount-1 do
   for j:=0 to sgENDamageRecovery2ENAct.ColCount-1 do
     sgENDamageRecovery2ENAct.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENDamageRecovery2ENActShow.actViewExecute(Sender: TObject);
Var TempENDamageRecovery2ENAct: ENDamageRecovery2ENActControllerSoapPort;
begin
 TempENDamageRecovery2ENAct := HTTPRIOENDamageRecovery2ENAct as ENDamageRecovery2ENActControllerSoapPort;
   try
     ENDamageRecovery2ENActObj := TempENDamageRecovery2ENAct.getObject(StrToInt(sgENDamageRecovery2ENAct.Cells[0,sgENDamageRecovery2ENAct.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDamageRecovery2ENActEdit:=TfrmENDamageRecovery2ENActEdit.Create(Application, dsView);
  try
    frmENDamageRecovery2ENActEdit.ShowModal;
  finally
    frmENDamageRecovery2ENActEdit.Free;
    frmENDamageRecovery2ENActEdit:=nil;
  end;
end;

procedure TfrmENDamageRecovery2ENActShow.actEditExecute(Sender: TObject);
Var TempENDamageRecovery2ENAct: ENDamageRecovery2ENActControllerSoapPort;
begin
 TempENDamageRecovery2ENAct := HTTPRIOENDamageRecovery2ENAct as ENDamageRecovery2ENActControllerSoapPort;
   try
     ENDamageRecovery2ENActObj := TempENDamageRecovery2ENAct.getObject(StrToInt(sgENDamageRecovery2ENAct.Cells[0,sgENDamageRecovery2ENAct.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDamageRecovery2ENActEdit:=TfrmENDamageRecovery2ENActEdit.Create(Application, dsEdit);
  try
    if frmENDamageRecovery2ENActEdit.ShowModal= mrOk then
      begin
        //TempENDamageRecovery2ENAct.save(ENDamageRecovery2ENActObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENDamageRecovery2ENActEdit.Free;
    frmENDamageRecovery2ENActEdit:=nil;
  end;
end;

procedure TfrmENDamageRecovery2ENActShow.actDeleteExecute(Sender: TObject);
Var TempENDamageRecovery2ENAct: ENDamageRecovery2ENActControllerSoapPort;
  ObjCode: Integer;
begin
 TempENDamageRecovery2ENAct := HTTPRIOENDamageRecovery2ENAct as ENDamageRecovery2ENActControllerSoapPort;
   try
     ObjCode := StrToInt(sgENDamageRecovery2ENAct.Cells[0,sgENDamageRecovery2ENAct.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Зв`язок акту відшкодування збитків з актами виконаних робіт) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENDamageRecovery2ENAct.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENDamageRecovery2ENActShow.actInsertExecute(Sender: TObject);
// Var TempENDamageRecovery2ENAct: ENDamageRecovery2ENActControllerSoapPort; 
begin
  // TempENDamageRecovery2ENAct := HTTPRIOENDamageRecovery2ENAct as ENDamageRecovery2ENActControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENDamageRecovery2ENActObj:=ENDamageRecovery2ENAct.Create;

   //ENDamageRecovery2ENActObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENDamageRecovery2ENActEdit:=TfrmENDamageRecovery2ENActEdit.Create(Application, dsInsert);
    try
      if frmENDamageRecovery2ENActEdit.ShowModal = mrOk then
      begin
        if ENDamageRecovery2ENActObj<>nil then
            //TempENDamageRecovery2ENAct.add(ENDamageRecovery2ENActObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENDamageRecovery2ENActEdit.Free;
      frmENDamageRecovery2ENActEdit:=nil;
    end;
  finally
    ENDamageRecovery2ENActObj.Free;
  end;
end;

procedure TfrmENDamageRecovery2ENActShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENDamageRecovery2ENActShow.actFilterExecute(Sender: TObject);
begin
{frmENDamageRecovery2ENActFilterEdit:=TfrmENDamageRecovery2ENActFilterEdit.Create(Application, dsInsert);
  try
    ENDamageRecovery2ENActFilterObj := ENDamageRecovery2ENActFilter.Create;
    SetNullIntProps(ENDamageRecovery2ENActFilterObj);
    SetNullXSProps(ENDamageRecovery2ENActFilterObj);

    if frmENDamageRecovery2ENActFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENDamageRecovery2ENActFilter.Create;
      FilterObject := ENDamageRecovery2ENActFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENDamageRecovery2ENActFilterEdit.Free;
    frmENDamageRecovery2ENActFilterEdit:=nil;
  end;}
end;

procedure TfrmENDamageRecovery2ENActShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.