
unit ShowRQInvoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQInvoiceController, AdvObj ;


type
  TfrmRQInvoiceShow = class(TChildForm)  
  HTTPRIORQInvoice: THTTPRIO;
    ImageList1: TImageList;
    sgRQInvoice: TAdvStringGrid;
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
    N9: TMenuItem;
    actConfirm: TAction;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgRQInvoiceTopLeftChanged(Sender: TObject);
procedure sgRQInvoiceDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure actConfirmExecute(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

var
 frmRQInvoiceShow : TfrmRQInvoiceShow;
 // RQInvoiceObj: RQInvoice;
 // RQInvoiceFilterObj: RQInvoiceFilter;
  
  
implementation

uses Main, EditRQInvoice, EditRQInvoiceFilter, DMReportsUnit, ENConsts;


{$R *.dfm}

var
  //frmRQInvoiceShow : TfrmRQInvoiceShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQInvoiceHeaders: array [1..8] of String =
        ( 'Код'
          ,'Номер'
          ,'Номер проекта'
          ,'Дата накладної'
          ,'Сума по накладній'
          ,'постачальник'
          ,'стан накладної'
          ,'користувач який вніс зміни'
        );
   

procedure TfrmRQInvoiceShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQInvoiceShow:=nil;
    inherited;
  end;


procedure TfrmRQInvoiceShow.FormShow(Sender: TObject);
var
  TempRQInvoice: RQInvoiceControllerSoapPort;
  i: Integer;
  RQInvoiceList: RQInvoiceShortList;
  begin
  SetGridHeaders(RQInvoiceHeaders, sgRQInvoice.ColumnHeaders);
  ColCount:=100;
  TempRQInvoice :=  HTTPRIORQInvoice as RQInvoiceControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQInvoiceFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQInvoiceList := TempRQInvoice.getScrollableFilteredList(RQInvoiceFilter(FilterObject),0,ColCount);


  LastCount:=High(RQInvoiceList.list);

  if LastCount > -1 then
     sgRQInvoice.RowCount:=LastCount+2
  else
     sgRQInvoice.RowCount:=2;

   with sgRQInvoice do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQInvoiceList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQInvoiceList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQInvoiceList.list[i].numberDoc;
        Cells[2,i+1] := RQInvoiceList.list[i].numberProject;
        if RQInvoiceList.list[i].dateGen = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(RQInvoiceList.list[i].dateGen);

        if RQInvoiceList.list[i].sumGen = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := RQInvoiceList.list[i].sumGen.DecimalString;

        Alignments[4,i + 1] := taRightJustify;
        Colors[4,i + 1] := $0080FF80;

        Cells[5,i+1] := RQInvoiceList.list[i].orgName;
        Cells[6,i+1] := RQInvoiceList.list[i].statusRefName;
        Cells[7,i+1] := RQInvoiceList.list[i].userGen;

        LastRow:=i+1;
        sgRQInvoice.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQInvoice.Row:=1;
end;

procedure TfrmRQInvoiceShow.sgRQInvoiceTopLeftChanged(Sender: TObject);
var
  TempRQInvoice: RQInvoiceControllerSoapPort;
  i,CurrentRow: Integer;
  RQInvoiceList: RQInvoiceShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQInvoice.TopRow + sgRQInvoice.VisibleRowCount) = ColCount
  then
    begin
      TempRQInvoice :=  HTTPRIORQInvoice as RQInvoiceControllerSoapPort;
      CurrentRow:=sgRQInvoice.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQInvoiceFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQInvoiceList := TempRQInvoice.getScrollableFilteredList(RQInvoiceFilter(FilterObject),ColCount-1, 100);



  sgRQInvoice.RowCount:=sgRQInvoice.RowCount+100;
  LastCount:=High(RQInvoiceList.list);
  with sgRQInvoice do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQInvoiceList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQInvoiceList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQInvoiceList.list[i].numberDoc;
        Cells[2,i+CurrentRow] := RQInvoiceList.list[i].numberProject;
        if RQInvoiceList.list[i].dateGen = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDate2String(RQInvoiceList.list[i].dateGen);

        if RQInvoiceList.list[i].sumGen = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := RQInvoiceList.list[i].sumGen.DecimalString;

        Alignments[4,i+CurrentRow] := taRightJustify;
        Colors[4,i+CurrentRow] := $0080FF80;

        Cells[5,i+CurrentRow] := RQInvoiceList.list[i].orgName;

        Cells[6,i+CurrentRow] := RQInvoiceList.list[i].statusRefName;
        Cells[7,i+CurrentRow] := RQInvoiceList.list[i].userGen;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQInvoice.Row:=CurrentRow-5;
   sgRQInvoice.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQInvoiceShow.sgRQInvoiceDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQInvoice,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQInvoiceShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQInvoice.RowCount-1 do
   for j:=0 to sgRQInvoice.ColCount-1 do
     sgRQInvoice.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQInvoiceShow.actViewExecute(Sender: TObject);
Var TempRQInvoice: RQInvoiceControllerSoapPort;
    ObjCode : Integer;
begin
 TempRQInvoice := HTTPRIORQInvoice as RQInvoiceControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQInvoice.Cells[0,sgRQInvoice.Row]);
   except
   on EConvertError do Exit;
  end;
  frmRQInvoiceEdit:=TfrmRQInvoiceEdit.Create(Application, dsView);
  try
    frmRQInvoiceEdit.RQInvoiceObj := TempRQInvoice.getObject(ObjCode);
    frmRQInvoiceEdit.ShowModal;
  finally
    frmRQInvoiceEdit.Free;
    frmRQInvoiceEdit:=nil;
  end;
end;

procedure TfrmRQInvoiceShow.actEditExecute(Sender: TObject);
Var TempRQInvoice: RQInvoiceControllerSoapPort;
    ObjCode : Integer;
begin
 TempRQInvoice := HTTPRIORQInvoice as RQInvoiceControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQInvoice.Cells[0,sgRQInvoice.Row]);
   except
   on EConvertError do Exit;
  end;
  frmRQInvoiceEdit:=TfrmRQInvoiceEdit.Create(Application, dsEdit);

  try
    frmRQInvoiceEdit.RQInvoiceObj := TempRQInvoice.getObject(ObjCode);
    if frmRQInvoiceEdit.ShowModal= mrOk then
      begin
        //TempRQInvoice.save(RQInvoiceObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQInvoiceEdit.Free;
    frmRQInvoiceEdit:=nil;
  end;
end;

procedure TfrmRQInvoiceShow.actDeleteExecute(Sender: TObject);
Var TempRQInvoice: RQInvoiceControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQInvoice := HTTPRIORQInvoice as RQInvoiceControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQInvoice.Cells[0,sgRQInvoice.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Накладна) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQInvoice.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQInvoiceShow.actInsertExecute(Sender: TObject);
Var TempRQInvoice: RQInvoiceControllerSoapPort;
begin
  TempRQInvoice := HTTPRIORQInvoice as RQInvoiceControllerSoapPort;

  if FilterObject = nil then Exit;

  try
   frmRQInvoiceEdit:=TfrmRQInvoiceEdit.Create(Application, dsInsert);

   frmRQInvoiceEdit.RQInvoiceObj:=RQInvoice.Create;
   frmRQInvoiceEdit.RQInvoiceObj.dateGen:= TXSDate.Create;
   frmRQInvoiceEdit.RQInvoiceObj.dateEdit:= TXSDate.Create;

    try
      if frmRQInvoiceEdit.ShowModal = mrOk then
      begin
        if frmRQInvoiceEdit.RQInvoiceObj <> nil then
            //TempRQInvoice.add(RQInvoiceObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQInvoiceEdit.Free;
      frmRQInvoiceEdit:=nil;
    end;
  finally
    //RQInvoiceObj.Free;
  end;
end;


procedure TfrmRQInvoiceShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQInvoiceShow.actFilterExecute(Sender: TObject);
begin
{frmRQInvoiceFilterEdit:=TfrmRQInvoiceFilterEdit.Create(Application, dsEdit);
  try
    RQInvoiceFilterObj := RQInvoiceFilter.Create;
    SetNullIntProps(RQInvoiceFilterObj);
    SetNullXSProps(RQInvoiceFilterObj);

    if frmRQInvoiceFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQInvoiceFilter.Create;
      FilterObject := RQInvoiceFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQInvoiceFilterEdit.Free;
    frmRQInvoiceFilterEdit:=nil;
  end;}
end;

procedure TfrmRQInvoiceShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;


procedure TfrmRQInvoiceShow.PopupMenu1Popup(Sender: TObject);
var
   invoice : RQInvoice;
   objCode : Integer;
begin
  inherited;

   try
     objCode := StrToInt(sgRQInvoice.Cells[0,sgRQInvoice.Row]);
   except
     on EConvertError do Exit;
   end;

  DisableActions([actConfirm]);

  invoice := DMReports.getRQInvoice(objCode);
  if invoice = nil then exit;

  actConfirm.Enabled := (invoice.statusRef.code = RQINVOICE_STATUS_NEW);
  actConfirm.Visible := actConfirm.Enabled;

  //actUnConfirm.Enabled :=  (invoice.statusRef.code = RQINVOICE_STATUS_CONFIRMED);
  //actUnConfirm.Visible := actUnConfirm.Enabled;


end;


procedure TfrmRQInvoiceShow.actConfirmExecute(Sender: TObject);
var
   TempRQInvoice: RQInvoiceControllerSoapPort;
   ObjCode : Integer;
begin
   try
     ObjCode := StrToInt(sgRQInvoice.Cells[0,sgRQInvoice.Row]);
   except
   on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Прийняти накладну у роботу?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin

      TempRQInvoice := HTTPRIORQInvoice as RQInvoiceControllerSoapPort;
      TempRQInvoice.confirmInvoice(ObjCode);
      UpdateGrid(Sender);
  end;
end;

end.
