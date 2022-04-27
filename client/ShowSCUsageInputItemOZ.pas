
unit ShowSCUsageInputItemOZ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  SCUsageInputItemOZController, AdvObj ;


type
  TfrmSCUsageInputItemOZShow = class(TChildForm)  
  HTTPRIOSCUsageInputItemOZ: THTTPRIO;
    ImageList1: TImageList;
    sgSCUsageInputItemOZ: TAdvStringGrid;
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
procedure sgSCUsageInputItemOZTopLeftChanged(Sender: TObject);
procedure sgSCUsageInputItemOZDblClick(Sender: TObject);
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
 frmSCUsageInputItemOZShow : TfrmSCUsageInputItemOZShow;
 // SCUsageInputItemOZObj: SCUsageInputItemOZ;
 // SCUsageInputItemOZFilterObj: SCUsageInputItemOZFilter;
  
  
implementation

uses Main, EditSCUsageInputItemOZ, EditSCUsageInputItemOZFilter;


{$R *.dfm}

var
  //frmSCUsageInputItemOZShow : TfrmSCUsageInputItemOZShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  SCUsageInputItemOZHeaders: array [1..7] of String =
        ( 'Код'
          ,'Номер документу'
          ,'Тип  лічільника'
          ,'счет'
          ,'Вартість'
          ,'кіль-сть'
          ,'код з SC'
        );
   

procedure TfrmSCUsageInputItemOZShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmSCUsageInputItemOZShow:=nil;
    inherited;
  end;


procedure TfrmSCUsageInputItemOZShow.FormShow(Sender: TObject);
var
  TempSCUsageInputItemOZ: SCUsageInputItemOZControllerSoapPort;
  i: Integer;
  SCUsageInputItemOZList: SCUsageInputItemOZShortList;
  begin
  SetGridHeaders(SCUsageInputItemOZHeaders, sgSCUsageInputItemOZ.ColumnHeaders);
  ColCount:=100;
  TempSCUsageInputItemOZ :=  HTTPRIOSCUsageInputItemOZ as SCUsageInputItemOZControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := SCUsageInputItemOZFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  SCUsageInputItemOZList := TempSCUsageInputItemOZ.getScrollableFilteredList(SCUsageInputItemOZFilter(FilterObject),0,ColCount);


  LastCount:=High(SCUsageInputItemOZList.list);

  if LastCount > -1 then
     sgSCUsageInputItemOZ.RowCount:=LastCount+2
  else
     sgSCUsageInputItemOZ.RowCount:=2;

   with sgSCUsageInputItemOZ do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if SCUsageInputItemOZList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(SCUsageInputItemOZList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := SCUsageInputItemOZList.list[i].numberDoc;
        Cells[2,i+1] := SCUsageInputItemOZList.list[i].counterType;
        Cells[3,i+1] := SCUsageInputItemOZList.list[i].account;
        if SCUsageInputItemOZList.list[i].cost = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := SCUsageInputItemOZList.list[i].cost.DecimalString;
        if SCUsageInputItemOZList.list[i].countGen = Low(Integer) then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := IntToStr(SCUsageInputItemOZList.list[i].countGen);
        if SCUsageInputItemOZList.list[i].scCode = Low(Integer) then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := IntToStr(SCUsageInputItemOZList.list[i].scCode);
        LastRow:=i+1;
        sgSCUsageInputItemOZ.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgSCUsageInputItemOZ.Row:=1;
end;

procedure TfrmSCUsageInputItemOZShow.sgSCUsageInputItemOZTopLeftChanged(Sender: TObject);
var
  TempSCUsageInputItemOZ: SCUsageInputItemOZControllerSoapPort;
  i,CurrentRow: Integer;
  SCUsageInputItemOZList: SCUsageInputItemOZShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgSCUsageInputItemOZ.TopRow + sgSCUsageInputItemOZ.VisibleRowCount) = ColCount
  then
    begin
      TempSCUsageInputItemOZ :=  HTTPRIOSCUsageInputItemOZ as SCUsageInputItemOZControllerSoapPort;
      CurrentRow:=sgSCUsageInputItemOZ.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := SCUsageInputItemOZFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  SCUsageInputItemOZList := TempSCUsageInputItemOZ.getScrollableFilteredList(SCUsageInputItemOZFilter(FilterObject),ColCount-1, 100);



  sgSCUsageInputItemOZ.RowCount:=sgSCUsageInputItemOZ.RowCount+100;
  LastCount:=High(SCUsageInputItemOZList.list);
  with sgSCUsageInputItemOZ do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if SCUsageInputItemOZList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(SCUsageInputItemOZList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := SCUsageInputItemOZList.list[i].numberDoc;
        Cells[2,i+CurrentRow] := SCUsageInputItemOZList.list[i].counterType;
        Cells[3,i+CurrentRow] := SCUsageInputItemOZList.list[i].account;
        if SCUsageInputItemOZList.list[i].cost = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := SCUsageInputItemOZList.list[i].cost.DecimalString;
        if SCUsageInputItemOZList.list[i].countGen = Low(Integer) then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := IntToStr(SCUsageInputItemOZList.list[i].countGen);
        if SCUsageInputItemOZList.list[i].scCode = Low(Integer) then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := IntToStr(SCUsageInputItemOZList.list[i].scCode);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgSCUsageInputItemOZ.Row:=CurrentRow-5;
   sgSCUsageInputItemOZ.RowCount:=LastRow+1;
  end;
end;

procedure TfrmSCUsageInputItemOZShow.sgSCUsageInputItemOZDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgSCUsageInputItemOZ,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmSCUsageInputItemOZShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgSCUsageInputItemOZ.RowCount-1 do
   for j:=0 to sgSCUsageInputItemOZ.ColCount-1 do
     sgSCUsageInputItemOZ.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmSCUsageInputItemOZShow.actViewExecute(Sender: TObject);
Var TempSCUsageInputItemOZ: SCUsageInputItemOZControllerSoapPort;
begin
 TempSCUsageInputItemOZ := HTTPRIOSCUsageInputItemOZ as SCUsageInputItemOZControllerSoapPort;
   try
     SCUsageInputItemOZObj := TempSCUsageInputItemOZ.getObject(StrToInt(sgSCUsageInputItemOZ.Cells[0,sgSCUsageInputItemOZ.Row]));
   except
   on EConvertError do Exit;
  end;
  frmSCUsageInputItemOZEdit:=TfrmSCUsageInputItemOZEdit.Create(Application, dsView);
  try
    frmSCUsageInputItemOZEdit.ShowModal;
  finally
    frmSCUsageInputItemOZEdit.Free;
    frmSCUsageInputItemOZEdit:=nil;
  end;
end;

procedure TfrmSCUsageInputItemOZShow.actEditExecute(Sender: TObject);
Var TempSCUsageInputItemOZ: SCUsageInputItemOZControllerSoapPort;
begin
 TempSCUsageInputItemOZ := HTTPRIOSCUsageInputItemOZ as SCUsageInputItemOZControllerSoapPort;
   try
     SCUsageInputItemOZObj := TempSCUsageInputItemOZ.getObject(StrToInt(sgSCUsageInputItemOZ.Cells[0,sgSCUsageInputItemOZ.Row]));
   except
   on EConvertError do Exit;
  end;
  frmSCUsageInputItemOZEdit:=TfrmSCUsageInputItemOZEdit.Create(Application, dsEdit);
  try
    if frmSCUsageInputItemOZEdit.ShowModal= mrOk then
      begin
        //TempSCUsageInputItemOZ.save(SCUsageInputItemOZObj);
        UpdateGrid(Sender);
      end;
  finally
    frmSCUsageInputItemOZEdit.Free;
    frmSCUsageInputItemOZEdit:=nil;
  end;
end;

procedure TfrmSCUsageInputItemOZShow.actDeleteExecute(Sender: TObject);
Var TempSCUsageInputItemOZ: SCUsageInputItemOZControllerSoapPort;
  ObjCode: Integer;
begin
 TempSCUsageInputItemOZ := HTTPRIOSCUsageInputItemOZ as SCUsageInputItemOZControllerSoapPort;
   try
     ObjCode := StrToInt(sgSCUsageInputItemOZ.Cells[0,sgSCUsageInputItemOZ.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Документ ОЗ для вводу в експлуатацію Лічільників) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempSCUsageInputItemOZ.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmSCUsageInputItemOZShow.actInsertExecute(Sender: TObject);
Var TempSCUsageInputItemOZ: SCUsageInputItemOZControllerSoapPort;
begin
  TempSCUsageInputItemOZ := HTTPRIOSCUsageInputItemOZ as SCUsageInputItemOZControllerSoapPort;
  SCUsageInputItemOZObj:=SCUsageInputItemOZ.Create;

   //SCUsageInputItemOZObj.cost:= TXSDecimal.Create;


  try
    frmSCUsageInputItemOZEdit:=TfrmSCUsageInputItemOZEdit.Create(Application, dsInsert);
    try
      if frmSCUsageInputItemOZEdit.ShowModal = mrOk then
      begin
        if SCUsageInputItemOZObj<>nil then
            //TempSCUsageInputItemOZ.add(SCUsageInputItemOZObj);
            UpdateGrid(Sender);
      end;
    finally
      frmSCUsageInputItemOZEdit.Free;
      frmSCUsageInputItemOZEdit:=nil;
    end;
  finally
    SCUsageInputItemOZObj.Free;
  end;
end;

procedure TfrmSCUsageInputItemOZShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmSCUsageInputItemOZShow.actFilterExecute(Sender: TObject);
begin
{frmSCUsageInputItemOZFilterEdit:=TfrmSCUsageInputItemOZFilterEdit.Create(Application, dsInsert);
  try
    SCUsageInputItemOZFilterObj := SCUsageInputItemOZFilter.Create;
    SetNullIntProps(SCUsageInputItemOZFilterObj);
    SetNullXSProps(SCUsageInputItemOZFilterObj);

    if frmSCUsageInputItemOZFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := SCUsageInputItemOZFilter.Create;
      FilterObject := SCUsageInputItemOZFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmSCUsageInputItemOZFilterEdit.Free;
    frmSCUsageInputItemOZFilterEdit:=nil;
  end;}
end;

procedure TfrmSCUsageInputItemOZShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.