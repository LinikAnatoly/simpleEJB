
unit ShowRQFKOrderItemRemainder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQFKOrderItemRemainderController ;


type
  TfrmRQFKOrderItemRemainderShow = class(TChildForm)  
  HTTPRIORQFKOrderItemRemainder: THTTPRIO;
    ImageList1: TImageList;
    sgRQFKOrderItemRemainder: TAdvStringGrid;
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
procedure sgRQFKOrderItemRemainderTopLeftChanged(Sender: TObject);
procedure sgRQFKOrderItemRemainderDblClick(Sender: TObject);
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
 // RQFKOrderItemRemainderObj: RQFKOrderItemRemainder;
 // RQFKOrderItemRemainderFilterObj: RQFKOrderItemRemainderFilter;
  
  
implementation

uses Main, EditRQFKOrderItemRemainder, EditRQFKOrderItemRemainderFilter;


{$R *.dfm}

var
  //frmRQFKOrderItemRemainderShow : TfrmRQFKOrderItemRemainderShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQFKOrderItemRemainderHeaders: array [1..5] of String =
        ( 'Код'
          ,'Назва матеріалу з Накладної'
          ,'кількість у заявці'
          ,'ціна без ПДВ'
          ,'сума без ПДВ'
        );
   

procedure TfrmRQFKOrderItemRemainderShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQFKOrderItemRemainderShow:=nil;
    inherited;
  end;


procedure TfrmRQFKOrderItemRemainderShow.FormShow(Sender: TObject);
var
  TempRQFKOrderItemRemainder: RQFKOrderItemRemainderControllerSoapPort;
  i: Integer;
  RQFKOrderItemRemainderList: RQFKOrderItemRemainderShortList;
  begin
  SetGridHeaders(RQFKOrderItemRemainderHeaders, sgRQFKOrderItemRemainder.ColumnHeaders);
  ColCount:=100;
  TempRQFKOrderItemRemainder :=  HTTPRIORQFKOrderItemRemainder as RQFKOrderItemRemainderControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQFKOrderItemRemainderFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQFKOrderItemRemainderList := TempRQFKOrderItemRemainder.getScrollableFilteredList(RQFKOrderItemRemainderFilter(FilterObject),0,ColCount);


  LastCount:=High(RQFKOrderItemRemainderList.list);

  if LastCount > -1 then
     sgRQFKOrderItemRemainder.RowCount:=LastCount+2
  else
     sgRQFKOrderItemRemainder.RowCount:=2;

   with sgRQFKOrderItemRemainder do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQFKOrderItemRemainderList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQFKOrderItemRemainderList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQFKOrderItemRemainderList.list[i].materialNameTxt;
        if RQFKOrderItemRemainderList.list[i].countGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := RQFKOrderItemRemainderList.list[i].countGen.DecimalString;
        if RQFKOrderItemRemainderList.list[i].priceWithoutNds = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := RQFKOrderItemRemainderList.list[i].priceWithoutNds.DecimalString;
        if RQFKOrderItemRemainderList.list[i].sumWithoutNds = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := RQFKOrderItemRemainderList.list[i].sumWithoutNds.DecimalString;
        LastRow:=i+1;
        sgRQFKOrderItemRemainder.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQFKOrderItemRemainder.Row:=1;
end;

procedure TfrmRQFKOrderItemRemainderShow.sgRQFKOrderItemRemainderTopLeftChanged(Sender: TObject);
var
  TempRQFKOrderItemRemainder: RQFKOrderItemRemainderControllerSoapPort;
  i,CurrentRow: Integer;
  RQFKOrderItemRemainderList: RQFKOrderItemRemainderShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQFKOrderItemRemainder.TopRow + sgRQFKOrderItemRemainder.VisibleRowCount) = ColCount
  then
    begin
      TempRQFKOrderItemRemainder :=  HTTPRIORQFKOrderItemRemainder as RQFKOrderItemRemainderControllerSoapPort;
      CurrentRow:=sgRQFKOrderItemRemainder.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQFKOrderItemRemainderFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQFKOrderItemRemainderList := TempRQFKOrderItemRemainder.getScrollableFilteredList(RQFKOrderItemRemainderFilter(FilterObject),ColCount-1, 100);



  sgRQFKOrderItemRemainder.RowCount:=sgRQFKOrderItemRemainder.RowCount+100;
  LastCount:=High(RQFKOrderItemRemainderList.list);
  with sgRQFKOrderItemRemainder do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQFKOrderItemRemainderList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQFKOrderItemRemainderList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQFKOrderItemRemainderList.list[i].materialNameTxt;
        if RQFKOrderItemRemainderList.list[i].countGen = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := RQFKOrderItemRemainderList.list[i].countGen.DecimalString;
        if RQFKOrderItemRemainderList.list[i].priceWithoutNds = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := RQFKOrderItemRemainderList.list[i].priceWithoutNds.DecimalString;
        if RQFKOrderItemRemainderList.list[i].sumWithoutNds = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := RQFKOrderItemRemainderList.list[i].sumWithoutNds.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQFKOrderItemRemainder.Row:=CurrentRow-5;
   sgRQFKOrderItemRemainder.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQFKOrderItemRemainderShow.sgRQFKOrderItemRemainderDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQFKOrderItemRemainder,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQFKOrderItemRemainderShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQFKOrderItemRemainder.RowCount-1 do
   for j:=0 to sgRQFKOrderItemRemainder.ColCount-1 do
     sgRQFKOrderItemRemainder.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQFKOrderItemRemainderShow.actViewExecute(Sender: TObject);
Var TempRQFKOrderItemRemainder: RQFKOrderItemRemainderControllerSoapPort;
begin
 TempRQFKOrderItemRemainder := HTTPRIORQFKOrderItemRemainder as RQFKOrderItemRemainderControllerSoapPort;
   try
     RQFKOrderItemRemainderObj := TempRQFKOrderItemRemainder.getObject(StrToInt(sgRQFKOrderItemRemainder.Cells[0,sgRQFKOrderItemRemainder.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQFKOrderItemRemainderEdit:=TfrmRQFKOrderItemRemainderEdit.Create(Application, dsView);
  try
    frmRQFKOrderItemRemainderEdit.ShowModal;
  finally
    frmRQFKOrderItemRemainderEdit.Free;
    frmRQFKOrderItemRemainderEdit:=nil;
  end;
end;

procedure TfrmRQFKOrderItemRemainderShow.actEditExecute(Sender: TObject);
Var TempRQFKOrderItemRemainder: RQFKOrderItemRemainderControllerSoapPort;
begin
 TempRQFKOrderItemRemainder := HTTPRIORQFKOrderItemRemainder as RQFKOrderItemRemainderControllerSoapPort;
   try
     RQFKOrderItemRemainderObj := TempRQFKOrderItemRemainder.getObject(StrToInt(sgRQFKOrderItemRemainder.Cells[0,sgRQFKOrderItemRemainder.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQFKOrderItemRemainderEdit:=TfrmRQFKOrderItemRemainderEdit.Create(Application, dsEdit);
  try
    if frmRQFKOrderItemRemainderEdit.ShowModal= mrOk then
      begin
        //TempRQFKOrderItemRemainder.save(RQFKOrderItemRemainderObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQFKOrderItemRemainderEdit.Free;
    frmRQFKOrderItemRemainderEdit:=nil;
  end;
end;

procedure TfrmRQFKOrderItemRemainderShow.actDeleteExecute(Sender: TObject);
Var TempRQFKOrderItemRemainder: RQFKOrderItemRemainderControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQFKOrderItemRemainder := HTTPRIORQFKOrderItemRemainder as RQFKOrderItemRemainderControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQFKOrderItemRemainder.Cells[0,sgRQFKOrderItemRemainder.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Надлишок строк ордера(без метериалів у планах)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQFKOrderItemRemainder.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQFKOrderItemRemainderShow.actInsertExecute(Sender: TObject);
Var TempRQFKOrderItemRemainder: RQFKOrderItemRemainderControllerSoapPort;
begin
  TempRQFKOrderItemRemainder := HTTPRIORQFKOrderItemRemainder as RQFKOrderItemRemainderControllerSoapPort;
  RQFKOrderItemRemainderObj:=RQFKOrderItemRemainder.Create;

   RQFKOrderItemRemainderObj.countGen:= TXSDecimal.Create;
   RQFKOrderItemRemainderObj.priceWithoutNds:= TXSDecimal.Create;
   RQFKOrderItemRemainderObj.sumWithoutNds:= TXSDecimal.Create;


  try
    frmRQFKOrderItemRemainderEdit:=TfrmRQFKOrderItemRemainderEdit.Create(Application, dsInsert);
    try
      if frmRQFKOrderItemRemainderEdit.ShowModal = mrOk then
      begin
        if RQFKOrderItemRemainderObj<>nil then
            //TempRQFKOrderItemRemainder.add(RQFKOrderItemRemainderObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQFKOrderItemRemainderEdit.Free;
      frmRQFKOrderItemRemainderEdit:=nil;
    end;
  finally
    RQFKOrderItemRemainderObj.Free;
  end;
end;

procedure TfrmRQFKOrderItemRemainderShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQFKOrderItemRemainderShow.actFilterExecute(Sender: TObject);
begin
{frmRQFKOrderItemRemainderFilterEdit:=TfrmRQFKOrderItemRemainderFilterEdit.Create(Application, dsEdit);
  try
    RQFKOrderItemRemainderFilterObj := RQFKOrderItemRemainderFilter.Create;
    SetNullIntProps(RQFKOrderItemRemainderFilterObj);
    SetNullXSProps(RQFKOrderItemRemainderFilterObj);

    if frmRQFKOrderItemRemainderFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQFKOrderItemRemainderFilter.Create;
      FilterObject := RQFKOrderItemRemainderFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQFKOrderItemRemainderFilterEdit.Free;
    frmRQFKOrderItemRemainderFilterEdit:=nil;
  end;}
end;

procedure TfrmRQFKOrderItemRemainderShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.