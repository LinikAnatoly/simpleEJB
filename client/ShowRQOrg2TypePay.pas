
unit ShowRQOrg2TypePay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQOrg2TypePayController, AdvObj ;


type
  TfrmRQOrg2TypePayShow = class(TChildForm)  
  HTTPRIORQOrg2TypePay: THTTPRIO;
    ImageList1: TImageList;
    sgRQOrg2TypePay: TAdvStringGrid;
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
procedure sgRQOrg2TypePayTopLeftChanged(Sender: TObject);
procedure sgRQOrg2TypePayDblClick(Sender: TObject);
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
 frmRQOrg2TypePayShow : TfrmRQOrg2TypePayShow;
 // RQOrg2TypePayObj: RQOrg2TypePay;
 // RQOrg2TypePayFilterObj: RQOrg2TypePayFilter;
  
  
implementation

uses Main, EditRQOrg2TypePay, EditRQOrg2TypePayFilter;


{$R *.dfm}

var
  //frmRQOrg2TypePayShow : TfrmRQOrg2TypePayShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQOrg2TypePayHeaders: array [1..10] of String =
        ( 'Код'
          ,'ПК внешней связи (Фин.Кол)'
          ,'Код организации'
          ,'Контрагент'
          ,'ОКПО'
          ,'E-mail'
          ,'Вид сплати'
          ,'Значення (% / дні)'
          ,'Користувач, що вніс зміни'
          ,'Дата останньої зміни'
        );
   

procedure TfrmRQOrg2TypePayShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQOrg2TypePayShow:=nil;
    inherited;
  end;


procedure TfrmRQOrg2TypePayShow.FormShow(Sender: TObject);
var
  TempRQOrg2TypePay: RQOrg2TypePayControllerSoapPort;
  i: Integer;
  RQOrg2TypePayList: RQOrg2TypePayShortList;
  begin
  SetGridHeaders(RQOrg2TypePayHeaders, sgRQOrg2TypePay.ColumnHeaders);
  ColCount:=100;
  TempRQOrg2TypePay :=  HTTPRIORQOrg2TypePay as RQOrg2TypePayControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQOrg2TypePayFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQOrg2TypePayList := TempRQOrg2TypePay.getScrollableFilteredList(RQOrg2TypePayFilter(FilterObject),0,ColCount);


  LastCount:=High(RQOrg2TypePayList.list);

  if LastCount > -1 then
     sgRQOrg2TypePay.RowCount:=LastCount+2
  else
     sgRQOrg2TypePay.RowCount:=2;

   with sgRQOrg2TypePay do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQOrg2TypePayList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQOrg2TypePayList.list[i].code)
        else
        Cells[0,i+1] := '';
        if RQOrg2TypePayList.list[i].id = Low(Integer) then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := IntToStr(RQOrg2TypePayList.list[i].id);
        Cells[2,i+1] := RQOrg2TypePayList.list[i].codeorg;
        Cells[3,i+1] := RQOrg2TypePayList.list[i].name;
        Cells[4,i+1] := RQOrg2TypePayList.list[i].okpo;
        Cells[5,i+1] := RQOrg2TypePayList.list[i].email;

        Cells[6,i+1] := RQOrg2TypePayList.list[i].typePayRefName;

        if RQOrg2TypePayList.list[i].paymentValue = Low(Integer) then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := IntToStr(RQOrg2TypePayList.list[i].paymentValue);
        Cells[8,i+1] := RQOrg2TypePayList.list[i].userGen;
        if RQOrg2TypePayList.list[i].dateEdit = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := XSDate2String(RQOrg2TypePayList.list[i].dateEdit);
        LastRow:=i+1;
        sgRQOrg2TypePay.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQOrg2TypePay.Row:=1;
end;

procedure TfrmRQOrg2TypePayShow.sgRQOrg2TypePayTopLeftChanged(Sender: TObject);
var
  TempRQOrg2TypePay: RQOrg2TypePayControllerSoapPort;
  i,CurrentRow: Integer;
  RQOrg2TypePayList: RQOrg2TypePayShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQOrg2TypePay.TopRow + sgRQOrg2TypePay.VisibleRowCount) = ColCount
  then
    begin
      TempRQOrg2TypePay :=  HTTPRIORQOrg2TypePay as RQOrg2TypePayControllerSoapPort;
      CurrentRow:=sgRQOrg2TypePay.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQOrg2TypePayFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQOrg2TypePayList := TempRQOrg2TypePay.getScrollableFilteredList(RQOrg2TypePayFilter(FilterObject),ColCount-1, 100);



  sgRQOrg2TypePay.RowCount:=sgRQOrg2TypePay.RowCount+100;
  LastCount:=High(RQOrg2TypePayList.list);
  with sgRQOrg2TypePay do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQOrg2TypePayList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQOrg2TypePayList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if RQOrg2TypePayList.list[i].id = Low(Integer) then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := IntToStr(RQOrg2TypePayList.list[i].id);
        Cells[2,i+CurrentRow] := RQOrg2TypePayList.list[i].codeorg;
        Cells[3,i+CurrentRow] := RQOrg2TypePayList.list[i].name;
        Cells[4,i+CurrentRow] := RQOrg2TypePayList.list[i].okpo;
        Cells[5,i+CurrentRow] := RQOrg2TypePayList.list[i].email;

        Cells[6,i+CurrentRow] := RQOrg2TypePayList.list[i].typePayRefName;

        if RQOrg2TypePayList.list[i].paymentValue = Low(Integer) then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := IntToStr(RQOrg2TypePayList.list[i].paymentValue);
        Cells[8,i+CurrentRow] := RQOrg2TypePayList.list[i].userGen;
        if RQOrg2TypePayList.list[i].dateEdit = nil then
          Cells[9,i+CurrentRow] := ''
        else
          Cells[9,i+CurrentRow] := XSDate2String(RQOrg2TypePayList.list[i].dateEdit);
        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQOrg2TypePay.Row:=CurrentRow-5;
   sgRQOrg2TypePay.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQOrg2TypePayShow.sgRQOrg2TypePayDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQOrg2TypePay,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQOrg2TypePayShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQOrg2TypePay.RowCount-1 do
   for j:=0 to sgRQOrg2TypePay.ColCount-1 do
     sgRQOrg2TypePay.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQOrg2TypePayShow.actViewExecute(Sender: TObject);
Var TempRQOrg2TypePay: RQOrg2TypePayControllerSoapPort;
begin
 TempRQOrg2TypePay := HTTPRIORQOrg2TypePay as RQOrg2TypePayControllerSoapPort;
   try
     RQOrg2TypePayObj := TempRQOrg2TypePay.getObject(StrToInt(sgRQOrg2TypePay.Cells[0,sgRQOrg2TypePay.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQOrg2TypePayEdit:=TfrmRQOrg2TypePayEdit.Create(Application, dsView);
  try
    frmRQOrg2TypePayEdit.ShowModal;
  finally
    frmRQOrg2TypePayEdit.Free;
    frmRQOrg2TypePayEdit:=nil;
  end;
end;

procedure TfrmRQOrg2TypePayShow.actEditExecute(Sender: TObject);
Var TempRQOrg2TypePay: RQOrg2TypePayControllerSoapPort;
begin
 TempRQOrg2TypePay := HTTPRIORQOrg2TypePay as RQOrg2TypePayControllerSoapPort;
   try
     RQOrg2TypePayObj := TempRQOrg2TypePay.getObject(StrToInt(sgRQOrg2TypePay.Cells[0,sgRQOrg2TypePay.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQOrg2TypePayEdit:=TfrmRQOrg2TypePayEdit.Create(Application, dsEdit);
  try
    if frmRQOrg2TypePayEdit.ShowModal= mrOk then
      begin
        //TempRQOrg2TypePay.save(RQOrg2TypePayObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQOrg2TypePayEdit.Free;
    frmRQOrg2TypePayEdit:=nil;
  end;
end;

procedure TfrmRQOrg2TypePayShow.actDeleteExecute(Sender: TObject);
Var TempRQOrg2TypePay: RQOrg2TypePayControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQOrg2TypePay := HTTPRIORQOrg2TypePay as RQOrg2TypePayControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQOrg2TypePay.Cells[0,sgRQOrg2TypePay.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Види сплат за постачальниками) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQOrg2TypePay.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQOrg2TypePayShow.actInsertExecute(Sender: TObject);
// Var TempRQOrg2TypePay: RQOrg2TypePayControllerSoapPort; 
begin
  // TempRQOrg2TypePay := HTTPRIORQOrg2TypePay as RQOrg2TypePayControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQOrg2TypePayObj:=RQOrg2TypePay.Create;

   //RQOrg2TypePayObj.dateEdit:= TXSDate.Create;


  try
    frmRQOrg2TypePayEdit:=TfrmRQOrg2TypePayEdit.Create(Application, dsInsert);
    try
      if frmRQOrg2TypePayEdit.ShowModal = mrOk then
      begin
        if RQOrg2TypePayObj<>nil then
            //TempRQOrg2TypePay.add(RQOrg2TypePayObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQOrg2TypePayEdit.Free;
      frmRQOrg2TypePayEdit:=nil;
    end;
  finally
    RQOrg2TypePayObj.Free;
  end;
end;

procedure TfrmRQOrg2TypePayShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQOrg2TypePayShow.actFilterExecute(Sender: TObject);
begin
  frmRQOrg2TypePayFilterEdit:=TfrmRQOrg2TypePayFilterEdit.Create(Application, dsInsert);
  try
    RQOrg2TypePayFilterObj := RQOrg2TypePayFilter.Create;
    SetNullIntProps(RQOrg2TypePayFilterObj);
    SetNullXSProps(RQOrg2TypePayFilterObj);

    if frmRQOrg2TypePayFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQOrg2TypePayFilter.Create;
      FilterObject := RQOrg2TypePayFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQOrg2TypePayFilterEdit.Free;
    frmRQOrg2TypePayFilterEdit:=nil;
  end;
end;

procedure TfrmRQOrg2TypePayShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.