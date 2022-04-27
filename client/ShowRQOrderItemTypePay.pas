
unit ShowRQOrderItemTypePay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQOrderItemTypePayController, AdvObj ;


type
  TfrmRQOrderItemTypePayShow = class(TChildForm)  
  HTTPRIORQOrderItemTypePay: THTTPRIO;
    ImageList1: TImageList;
    sgRQOrderItemTypePay: TAdvStringGrid;
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
procedure sgRQOrderItemTypePayTopLeftChanged(Sender: TObject);
procedure sgRQOrderItemTypePayDblClick(Sender: TObject);
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
 frmRQOrderItemTypePayShow : TfrmRQOrderItemTypePayShow;
 // RQOrderItemTypePayObj: RQOrderItemTypePay;
 // RQOrderItemTypePayFilterObj: RQOrderItemTypePayFilter;
  
  
implementation

uses Main, EditRQOrderItemTypePay, EditRQOrderItemTypePayFilter //,
//	ShowRQOrderItemTypePay
;


{$R *.dfm}

var
  //frmRQOrderItemTypePayShow : TfrmRQOrderItemTypePayShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQOrderItemTypePayHeaders: array [1..2] of String =
        ( 'Код'
          ,'Вид оплаты по строке заявки'
        );
   

procedure TfrmRQOrderItemTypePayShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
			frmRQOrderItemTypePayShow:=nil;
    inherited;
	end;


procedure TfrmRQOrderItemTypePayShow.FormShow(Sender: TObject);
var
  TempRQOrderItemTypePay: RQOrderItemTypePayControllerSoapPort;
  i: Integer;
  RQOrderItemTypePayList: RQOrderItemTypePayShortList;
  begin
  SetGridHeaders(RQOrderItemTypePayHeaders, sgRQOrderItemTypePay.ColumnHeaders);
  ColCount:=100;
  TempRQOrderItemTypePay :=  HTTPRIORQOrderItemTypePay as RQOrderItemTypePayControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQOrderItemTypePayFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQOrderItemTypePayList := TempRQOrderItemTypePay.getScrollableFilteredList(RQOrderItemTypePayFilter(FilterObject),0,ColCount);


  LastCount:=High(RQOrderItemTypePayList.list);

  if LastCount > -1 then
     sgRQOrderItemTypePay.RowCount:=LastCount+2
  else
     sgRQOrderItemTypePay.RowCount:=2;

   with sgRQOrderItemTypePay do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQOrderItemTypePayList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQOrderItemTypePayList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQOrderItemTypePayList.list[i].name;
        LastRow:=i+1;
        sgRQOrderItemTypePay.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQOrderItemTypePay.Row:=1;
end;

procedure TfrmRQOrderItemTypePayShow.sgRQOrderItemTypePayTopLeftChanged(Sender: TObject);
var
  TempRQOrderItemTypePay: RQOrderItemTypePayControllerSoapPort;
  i,CurrentRow: Integer;
  RQOrderItemTypePayList: RQOrderItemTypePayShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQOrderItemTypePay.TopRow + sgRQOrderItemTypePay.VisibleRowCount) = ColCount
  then
    begin
      TempRQOrderItemTypePay :=  HTTPRIORQOrderItemTypePay as RQOrderItemTypePayControllerSoapPort;
      CurrentRow:=sgRQOrderItemTypePay.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQOrderItemTypePayFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQOrderItemTypePayList := TempRQOrderItemTypePay.getScrollableFilteredList(RQOrderItemTypePayFilter(FilterObject),ColCount-1, 100);



  sgRQOrderItemTypePay.RowCount:=sgRQOrderItemTypePay.RowCount+100;
  LastCount:=High(RQOrderItemTypePayList.list);
  with sgRQOrderItemTypePay do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQOrderItemTypePayList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQOrderItemTypePayList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQOrderItemTypePayList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQOrderItemTypePay.Row:=CurrentRow-5;
   sgRQOrderItemTypePay.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQOrderItemTypePayShow.sgRQOrderItemTypePayDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQOrderItemTypePay,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQOrderItemTypePayShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQOrderItemTypePay.RowCount-1 do
   for j:=0 to sgRQOrderItemTypePay.ColCount-1 do
     sgRQOrderItemTypePay.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQOrderItemTypePayShow.actViewExecute(Sender: TObject);
Var TempRQOrderItemTypePay: RQOrderItemTypePayControllerSoapPort;
begin
 TempRQOrderItemTypePay := HTTPRIORQOrderItemTypePay as RQOrderItemTypePayControllerSoapPort;
   try
     RQOrderItemTypePayObj := TempRQOrderItemTypePay.getObject(StrToInt(sgRQOrderItemTypePay.Cells[0,sgRQOrderItemTypePay.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQOrderItemTypePayEdit:=TfrmRQOrderItemTypePayEdit.Create(Application, dsView);
  try
    frmRQOrderItemTypePayEdit.ShowModal;
  finally
    frmRQOrderItemTypePayEdit.Free;
    frmRQOrderItemTypePayEdit:=nil;
  end;
end;

procedure TfrmRQOrderItemTypePayShow.actEditExecute(Sender: TObject);
Var TempRQOrderItemTypePay: RQOrderItemTypePayControllerSoapPort;
begin
 TempRQOrderItemTypePay := HTTPRIORQOrderItemTypePay as RQOrderItemTypePayControllerSoapPort;
   try
     RQOrderItemTypePayObj := TempRQOrderItemTypePay.getObject(StrToInt(sgRQOrderItemTypePay.Cells[0,sgRQOrderItemTypePay.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQOrderItemTypePayEdit:=TfrmRQOrderItemTypePayEdit.Create(Application, dsEdit);
  try
    if frmRQOrderItemTypePayEdit.ShowModal= mrOk then
      begin
        //TempRQOrderItemTypePay.save(RQOrderItemTypePayObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQOrderItemTypePayEdit.Free;
    frmRQOrderItemTypePayEdit:=nil;
  end;
end;

procedure TfrmRQOrderItemTypePayShow.actDeleteExecute(Sender: TObject);
Var TempRQOrderItemTypePay: RQOrderItemTypePayControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQOrderItemTypePay := HTTPRIORQOrderItemTypePay as RQOrderItemTypePayControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQOrderItemTypePay.Cells[0,sgRQOrderItemTypePay.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Вид оплаты по строке заявки) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQOrderItemTypePay.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQOrderItemTypePayShow.actInsertExecute(Sender: TObject);
// Var TempRQOrderItemTypePay: RQOrderItemTypePayControllerSoapPort; 
begin
  // TempRQOrderItemTypePay := HTTPRIORQOrderItemTypePay as RQOrderItemTypePayControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQOrderItemTypePayObj:=RQOrderItemTypePay.Create;



  try
    frmRQOrderItemTypePayEdit:=TfrmRQOrderItemTypePayEdit.Create(Application, dsInsert);
    try
      if frmRQOrderItemTypePayEdit.ShowModal = mrOk then
      begin
        if RQOrderItemTypePayObj<>nil then
            //TempRQOrderItemTypePay.add(RQOrderItemTypePayObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQOrderItemTypePayEdit.Free;
      frmRQOrderItemTypePayEdit:=nil;
    end;
  finally
    RQOrderItemTypePayObj.Free;
  end;
end;

procedure TfrmRQOrderItemTypePayShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQOrderItemTypePayShow.actFilterExecute(Sender: TObject);
begin
{frmRQOrderItemTypePayFilterEdit:=TfrmRQOrderItemTypePayFilterEdit.Create(Application, dsInsert);
  try
    RQOrderItemTypePayFilterObj := RQOrderItemTypePayFilter.Create;
    SetNullIntProps(RQOrderItemTypePayFilterObj);
    SetNullXSProps(RQOrderItemTypePayFilterObj);

    if frmRQOrderItemTypePayFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQOrderItemTypePayFilter.Create;
      FilterObject := RQOrderItemTypePayFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQOrderItemTypePayFilterEdit.Free;
    frmRQOrderItemTypePayFilterEdit:=nil;
  end;}
end;

procedure TfrmRQOrderItemTypePayShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.