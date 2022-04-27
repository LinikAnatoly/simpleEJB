
unit ShowENChangePersonByt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENChangePersonBytController ;


type
  TfrmENChangePersonBytShow = class(TChildForm)  
  HTTPRIOENChangePersonByt: THTTPRIO;
    ImageList1: TImageList;
    sgENChangePersonByt: TAdvStringGrid;
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
procedure sgENChangePersonBytTopLeftChanged(Sender: TObject);
procedure sgENChangePersonBytDblClick(Sender: TObject);
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
 // ENChangePersonBytObj: ENChangePersonByt;
 // ENChangePersonBytFilterObj: ENChangePersonBytFilter;
  
  
implementation

uses Main, EditENChangePersonByt, EditENChangePersonBytFilter;


{$R *.dfm}

var
  //frmENChangePersonBytShow : TfrmENChangePersonBytShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENChangePersonBytHeaders: array [1..6] of String =
        ( 'Код'
          ,'ПІБ'
          ,'Особовий рахунок'
          ,'Код пакета CN'
          ,'регистрационный номер входящего докуменат(docflow)'
          ,'Дата подачи запроса'
        );
   

procedure TfrmENChangePersonBytShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENChangePersonBytShow:=nil;
    inherited;
  end;


procedure TfrmENChangePersonBytShow.FormShow(Sender: TObject);
var
  TempENChangePersonByt: ENChangePersonBytControllerSoapPort;
  i: Integer;
  ENChangePersonBytList: ENChangePersonBytShortList;
  begin
  SetGridHeaders(ENChangePersonBytHeaders, sgENChangePersonByt.ColumnHeaders);
  ColCount:=100;
  TempENChangePersonByt :=  HTTPRIOENChangePersonByt as ENChangePersonBytControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENChangePersonBytFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENChangePersonBytList := TempENChangePersonByt.getScrollableFilteredList(ENChangePersonBytFilter(FilterObject),0,ColCount);


  LastCount:=High(ENChangePersonBytList.list);

  if LastCount > -1 then
     sgENChangePersonByt.RowCount:=LastCount+2
  else
     sgENChangePersonByt.RowCount:=2;

   with sgENChangePersonByt do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENChangePersonBytList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENChangePersonBytList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENChangePersonBytList.list[i].fio;
        Cells[2,i+1] := ENChangePersonBytList.list[i].accountNumber;
        if ENChangePersonBytList.list[i].packCode = Low(Integer) then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := IntToStr(ENChangePersonBytList.list[i].packCode);
        Cells[4,i+1] := ENChangePersonBytList.list[i].registrationNumber;
        if ENChangePersonBytList.list[i].registrationDate = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDate2String(ENChangePersonBytList.list[i].registrationDate);
        LastRow:=i+1;
        sgENChangePersonByt.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENChangePersonByt.Row:=1;
end;

procedure TfrmENChangePersonBytShow.sgENChangePersonBytTopLeftChanged(Sender: TObject);
var
  TempENChangePersonByt: ENChangePersonBytControllerSoapPort;
  i,CurrentRow: Integer;
  ENChangePersonBytList: ENChangePersonBytShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENChangePersonByt.TopRow + sgENChangePersonByt.VisibleRowCount) = ColCount
  then
    begin
      TempENChangePersonByt :=  HTTPRIOENChangePersonByt as ENChangePersonBytControllerSoapPort;
      CurrentRow:=sgENChangePersonByt.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENChangePersonBytFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENChangePersonBytList := TempENChangePersonByt.getScrollableFilteredList(ENChangePersonBytFilter(FilterObject),ColCount-1, 100);



  sgENChangePersonByt.RowCount:=sgENChangePersonByt.RowCount+100;
  LastCount:=High(ENChangePersonBytList.list);
  with sgENChangePersonByt do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENChangePersonBytList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENChangePersonBytList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENChangePersonBytList.list[i].fio;
        Cells[2,i+CurrentRow] := ENChangePersonBytList.list[i].accountNumber;
        if ENChangePersonBytList.list[i].packCode = Low(Integer) then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := IntToStr(ENChangePersonBytList.list[i].packCode);
        Cells[4,i+CurrentRow] := ENChangePersonBytList.list[i].registrationNumber;
        if ENChangePersonBytList.list[i].registrationDate = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := XSDate2String(ENChangePersonBytList.list[i].registrationDate);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENChangePersonByt.Row:=CurrentRow-5;
   sgENChangePersonByt.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENChangePersonBytShow.sgENChangePersonBytDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENChangePersonByt,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENChangePersonBytShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENChangePersonByt.RowCount-1 do
   for j:=0 to sgENChangePersonByt.ColCount-1 do
     sgENChangePersonByt.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENChangePersonBytShow.actViewExecute(Sender: TObject);
Var TempENChangePersonByt: ENChangePersonBytControllerSoapPort;
begin
 TempENChangePersonByt := HTTPRIOENChangePersonByt as ENChangePersonBytControllerSoapPort;
   try
     ENChangePersonBytObj := TempENChangePersonByt.getObject(StrToInt(sgENChangePersonByt.Cells[0,sgENChangePersonByt.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENChangePersonBytEdit:=TfrmENChangePersonBytEdit.Create(Application, dsView);
  try
    frmENChangePersonBytEdit.ShowModal;
  finally
    frmENChangePersonBytEdit.Free;
    frmENChangePersonBytEdit:=nil;
  end;
end;

procedure TfrmENChangePersonBytShow.actEditExecute(Sender: TObject);
Var TempENChangePersonByt: ENChangePersonBytControllerSoapPort;
begin
 TempENChangePersonByt := HTTPRIOENChangePersonByt as ENChangePersonBytControllerSoapPort;
   try
     ENChangePersonBytObj := TempENChangePersonByt.getObject(StrToInt(sgENChangePersonByt.Cells[0,sgENChangePersonByt.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENChangePersonBytEdit:=TfrmENChangePersonBytEdit.Create(Application, dsEdit);
  try
    if frmENChangePersonBytEdit.ShowModal= mrOk then
      begin
        //TempENChangePersonByt.save(ENChangePersonBytObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENChangePersonBytEdit.Free;
    frmENChangePersonBytEdit:=nil;
  end;
end;

procedure TfrmENChangePersonBytShow.actDeleteExecute(Sender: TObject);
Var TempENChangePersonByt: ENChangePersonBytControllerSoapPort;
  ObjCode: Integer;
begin
 TempENChangePersonByt := HTTPRIOENChangePersonByt as ENChangePersonBytControllerSoapPort;
   try
     ObjCode := StrToInt(sgENChangePersonByt.Cells[0,sgENChangePersonByt.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Зміна власника осбового рахунку (побут)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENChangePersonByt.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENChangePersonBytShow.actInsertExecute(Sender: TObject);
// Var TempENChangePersonByt: ENChangePersonBytControllerSoapPort; 
begin
  // TempENChangePersonByt := HTTPRIOENChangePersonByt as ENChangePersonBytControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENChangePersonBytObj:=ENChangePersonByt.Create;

   //ENChangePersonBytObj.registrationDate:= TXSDate.Create;


  try
    frmENChangePersonBytEdit:=TfrmENChangePersonBytEdit.Create(Application, dsInsert);
    try
      if frmENChangePersonBytEdit.ShowModal = mrOk then
      begin
        if ENChangePersonBytObj<>nil then
            //TempENChangePersonByt.add(ENChangePersonBytObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENChangePersonBytEdit.Free;
      frmENChangePersonBytEdit:=nil;
    end;
  finally
    ENChangePersonBytObj.Free;
  end;
end;

procedure TfrmENChangePersonBytShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENChangePersonBytShow.actFilterExecute(Sender: TObject);
begin
{frmENChangePersonBytFilterEdit:=TfrmENChangePersonBytFilterEdit.Create(Application, dsInsert);
  try
    ENChangePersonBytFilterObj := ENChangePersonBytFilter.Create;
    SetNullIntProps(ENChangePersonBytFilterObj);
    SetNullXSProps(ENChangePersonBytFilterObj);

    if frmENChangePersonBytFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENChangePersonBytFilter.Create;
      FilterObject := ENChangePersonBytFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENChangePersonBytFilterEdit.Free;
    frmENChangePersonBytFilterEdit:=nil;
  end;}
end;

procedure TfrmENChangePersonBytShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.