
unit ShowENDamageRecovery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENDamageRecoveryController, AdvObj ;


type
  TfrmENDamageRecoveryShow = class(TChildForm)  
  HTTPRIOENDamageRecovery: THTTPRIO;
    ImageList1: TImageList;
    sgENDamageRecovery: TAdvStringGrid;
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
procedure sgENDamageRecoveryTopLeftChanged(Sender: TObject);
procedure sgENDamageRecoveryDblClick(Sender: TObject);
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
 // ENDamageRecoveryObj: ENDamageRecovery;
 // ENDamageRecoveryFilterObj: ENDamageRecoveryFilter;
  
  
implementation

uses Main, EditENDamageRecovery, EditENDamageRecoveryFilter;


{$R *.dfm}

var
  //frmENDamageRecoveryShow : TfrmENDamageRecoveryShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENDamageRecoveryHeaders: array [1..14] of String =
        ( 'Код'
          ,'Номер акту'
          ,'Дата акту'
          ,'код договору'
          ,'код організації'
          ,'код договору у фін.кол.'
          ,'Примітка'
          ,'Платник'
          ,'Адреса платника'
          ,'Паспортні дані замовника'
          ,'Сумма ущерба'
          ,'Статус документу'
          ,'пользователь внесший изменение'
          ,'дата последнего изменения'
        );
   

procedure TfrmENDamageRecoveryShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENDamageRecoveryShow:=nil;
    inherited;
  end;


procedure TfrmENDamageRecoveryShow.FormShow(Sender: TObject);
var
  TempENDamageRecovery: ENDamageRecoveryControllerSoapPort;
  i: Integer;
  ENDamageRecoveryList: ENDamageRecoveryShortList;
  begin
  SetGridHeaders(ENDamageRecoveryHeaders, sgENDamageRecovery.ColumnHeaders);
  ColCount:=100;
  TempENDamageRecovery :=  HTTPRIOENDamageRecovery as ENDamageRecoveryControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENDamageRecoveryFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDamageRecoveryList := TempENDamageRecovery.getScrollableFilteredList(ENDamageRecoveryFilter(FilterObject),0,ColCount);


  LastCount:=High(ENDamageRecoveryList.list);

  if LastCount > -1 then
     sgENDamageRecovery.RowCount:=LastCount+2
  else
     sgENDamageRecovery.RowCount:=2;

   with sgENDamageRecovery do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDamageRecoveryList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENDamageRecoveryList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENDamageRecoveryList.list[i].numberGen;
        if ENDamageRecoveryList.list[i].dateGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENDamageRecoveryList.list[i].dateGen);
        Cells[3,i+1] := ENDamageRecoveryList.list[i].FKcontractCode;
        Cells[4,i+1] := ENDamageRecoveryList.list[i].FKpartnerCode;
        Cells[5,i+1] := ENDamageRecoveryList.list[i].FKdocCode;

        Cells[6,i+1] := ENDamageRecoveryList.list[i].commentGen;
        Cells[7,i+1] := ENDamageRecoveryList.list[i].contragentName;
        Cells[8,i+1] := ENDamageRecoveryList.list[i].contragentAddress;
        Cells[9,i+1] := ENDamageRecoveryList.list[i].contragentPassport;
        if ENDamageRecoveryList.list[i].damageAmmount = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := ENDamageRecoveryList.list[i].damageAmmount.DecimalString;

          Cells[11,i+1] := ENDamageRecoveryList.list[i].statusRefName;

        Cells[12,i+1] := ENDamageRecoveryList.list[i].userGen;
        if ENDamageRecoveryList.list[i].dateEdit = nil then
          Cells[13,i+1] := ''
        else
          Cells[13,i+1] := XSDate2String(ENDamageRecoveryList.list[i].dateEdit);
        LastRow:=i+1;
        sgENDamageRecovery.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENDamageRecovery.Row:=1;
end;

procedure TfrmENDamageRecoveryShow.sgENDamageRecoveryTopLeftChanged(Sender: TObject);
var
  TempENDamageRecovery: ENDamageRecoveryControllerSoapPort;
  i,CurrentRow: Integer;
  ENDamageRecoveryList: ENDamageRecoveryShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENDamageRecovery.TopRow + sgENDamageRecovery.VisibleRowCount) = ColCount
  then
    begin
      TempENDamageRecovery :=  HTTPRIOENDamageRecovery as ENDamageRecoveryControllerSoapPort;
      CurrentRow:=sgENDamageRecovery.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENDamageRecoveryFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDamageRecoveryList := TempENDamageRecovery.getScrollableFilteredList(ENDamageRecoveryFilter(FilterObject),ColCount-1, 100);

  sgENDamageRecovery.RowCount:=sgENDamageRecovery.RowCount+100;
  LastCount:=High(ENDamageRecoveryList.list);
  with sgENDamageRecovery do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDamageRecoveryList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENDamageRecoveryList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENDamageRecoveryList.list[i].numberGen;
        if ENDamageRecoveryList.list[i].dateGen = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENDamageRecoveryList.list[i].dateGen);
        Cells[3,i+CurrentRow] := ENDamageRecoveryList.list[i].FKcontractCode;
        Cells[4,i+CurrentRow] := ENDamageRecoveryList.list[i].FKpartnerCode;
        Cells[5,i+CurrentRow] := ENDamageRecoveryList.list[i].FKdocCode;

        Cells[6,i+CurrentRow] := ENDamageRecoveryList.list[i].commentGen;
        Cells[7,i+CurrentRow] := ENDamageRecoveryList.list[i].contragentName;
        Cells[8,i+CurrentRow] := ENDamageRecoveryList.list[i].contragentAddress;
        Cells[9,i+CurrentRow] := ENDamageRecoveryList.list[i].contragentPassport;
        if ENDamageRecoveryList.list[i].damageAmmount = nil then
          Cells[10,i+CurrentRow] := ''
        else
          Cells[10,i+CurrentRow] := ENDamageRecoveryList.list[i].damageAmmount.DecimalString;

        Cells[11,i+CurrentRow] := ENDamageRecoveryList.list[i].statusRefName;

        Cells[12,i+CurrentRow] := ENDamageRecoveryList.list[i].userGen;
        if ENDamageRecoveryList.list[i].dateEdit = nil then
          Cells[13,i+CurrentRow] := ''
        else
          Cells[13,i+CurrentRow] := XSDate2String(ENDamageRecoveryList.list[i].dateEdit);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENDamageRecovery.Row:=CurrentRow-5;
   sgENDamageRecovery.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENDamageRecoveryShow.sgENDamageRecoveryDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENDamageRecovery,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENDamageRecoveryShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENDamageRecovery.RowCount-1 do
   for j:=0 to sgENDamageRecovery.ColCount-1 do
     sgENDamageRecovery.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENDamageRecoveryShow.actViewExecute(Sender: TObject);
Var TempENDamageRecovery: ENDamageRecoveryControllerSoapPort;
begin
 TempENDamageRecovery := HTTPRIOENDamageRecovery as ENDamageRecoveryControllerSoapPort;
   try
     ENDamageRecoveryObj := TempENDamageRecovery.getObject(StrToInt(sgENDamageRecovery.Cells[0,sgENDamageRecovery.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDamageRecoveryEdit:=TfrmENDamageRecoveryEdit.Create(Application, dsView);
  try
    frmENDamageRecoveryEdit.ShowModal;
  finally
    frmENDamageRecoveryEdit.Free;
    frmENDamageRecoveryEdit:=nil;
  end;
end;

procedure TfrmENDamageRecoveryShow.actEditExecute(Sender: TObject);
Var TempENDamageRecovery: ENDamageRecoveryControllerSoapPort;
begin
 TempENDamageRecovery := HTTPRIOENDamageRecovery as ENDamageRecoveryControllerSoapPort;
   try
     ENDamageRecoveryObj := TempENDamageRecovery.getObject(StrToInt(sgENDamageRecovery.Cells[0,sgENDamageRecovery.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDamageRecoveryEdit:=TfrmENDamageRecoveryEdit.Create(Application, dsEdit);
  try
    if frmENDamageRecoveryEdit.ShowModal= mrOk then
      begin
        //TempENDamageRecovery.save(ENDamageRecoveryObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENDamageRecoveryEdit.Free;
    frmENDamageRecoveryEdit:=nil;
  end;
end;

procedure TfrmENDamageRecoveryShow.actDeleteExecute(Sender: TObject);
Var TempENDamageRecovery: ENDamageRecoveryControllerSoapPort;
  ObjCode: Integer;
begin
 TempENDamageRecovery := HTTPRIOENDamageRecovery as ENDamageRecoveryControllerSoapPort;
   try
     ObjCode := StrToInt(sgENDamageRecovery.Cells[0,sgENDamageRecovery.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Акт відшкодування збитків) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENDamageRecovery.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENDamageRecoveryShow.actInsertExecute(Sender: TObject);
// Var TempENDamageRecovery: ENDamageRecoveryControllerSoapPort; 
begin
  // TempENDamageRecovery := HTTPRIOENDamageRecovery as ENDamageRecoveryControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENDamageRecoveryObj:=ENDamageRecovery.Create;

   //ENDamageRecoveryObj.dateGen:= TXSDate.Create;
   //ENDamageRecoveryObj.damageAmmount:= TXSDecimal.Create;
   //ENDamageRecoveryObj.dateEdit:= TXSDate.Create;


  try
    frmENDamageRecoveryEdit:=TfrmENDamageRecoveryEdit.Create(Application, dsInsert);
    try
      if frmENDamageRecoveryEdit.ShowModal = mrOk then
      begin
        if ENDamageRecoveryObj<>nil then
            //TempENDamageRecovery.add(ENDamageRecoveryObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENDamageRecoveryEdit.Free;
      frmENDamageRecoveryEdit:=nil;
    end;
  finally
    ENDamageRecoveryObj.Free;
  end;
end;

procedure TfrmENDamageRecoveryShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENDamageRecoveryShow.actFilterExecute(Sender: TObject);
begin
frmENDamageRecoveryFilterEdit:=TfrmENDamageRecoveryFilterEdit.Create(Application, dsInsert);
  try
    ENDamageRecoveryFilterObj := ENDamageRecoveryFilter.Create;
    SetNullIntProps(ENDamageRecoveryFilterObj);
    SetNullXSProps(ENDamageRecoveryFilterObj);

    if frmENDamageRecoveryFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENDamageRecoveryFilter.Create;
      FilterObject := ENDamageRecoveryFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENDamageRecoveryFilterEdit.Free;
    frmENDamageRecoveryFilterEdit:=nil;
  end;
end;

procedure TfrmENDamageRecoveryShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.