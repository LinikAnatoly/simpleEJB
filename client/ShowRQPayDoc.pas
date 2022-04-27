
unit ShowRQPayDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQPayDocController, AdvObj;


type
  TfrmRQPayDocShow = class(TChildForm)  
  HTTPRIORQPayDoc: THTTPRIO;
    ImageList1: TImageList;
    sgRQPayDoc: TAdvStringGrid;
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
    ToolButton4: TToolButton;
    HTTPRIORQPayDocItem: THTTPRIO;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgRQPayDocTopLeftChanged(Sender: TObject);
procedure sgRQPayDocDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

//var

 // RQPayDocObj: RQPayDoc;
 // RQPayDocFilterObj: RQPayDocFilter;
  
  
implementation

uses Main, EditRQPayDoc,EditRQPayDocItem, EditRQPayDocFilter, RQPayDocItemController,
    ShowRQPayDocItem ;


{$R *.dfm}

var
  //frmRQPayDocShow : TfrmRQPayDocShow;
     //frmRQPayDocItemShow :  TfrmRQPayDocItemShow;
  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQPayDocHeaders: array [1..7] of String =
        ( 'Код'
          ,'Сума платежу'
          ,'Номер документа'
          ,'дата платежу'
          ,'Номер доручення'
          ,'Метод розрахунку'
          ,'Підзвітна особа'
        );
   

procedure TfrmRQPayDocShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQPayDocShow:=nil;
    inherited;
  end;


procedure TfrmRQPayDocShow.FormShow(Sender: TObject);
var
  TempRQPayDoc: RQPayDocControllerSoapPort;
  i: Integer;
  RQPayDocList: RQPayDocShortList;
begin
  SetGridHeaders(RQPayDocHeaders, sgRQPayDoc.ColumnHeaders);
  ColCount:=100;
  TempRQPayDoc :=  HTTPRIORQPayDoc as RQPayDocControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQPayDocFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQPayDocFilter(FilterObject).orderBySQL := 'dategen desc, RQPAYDOC.code desc';

  RQPayDocList := TempRQPayDoc.getScrollableFilteredList(RQPayDocFilter(FilterObject),0,ColCount);


  LastCount:=High(RQPayDocList.list);

  if LastCount > -1 then
     sgRQPayDoc.RowCount:=LastCount+2
  else
     sgRQPayDoc.RowCount:=2;

   with sgRQPayDoc do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPayDocList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQPayDocList.list[i].code)
        else
        Cells[0,i+1] := '';
        if RQPayDocList.list[i].summaGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := RQPayDocList.list[i].summaGen.DecimalString;
        Cells[2,i+1] := RQPayDocList.list[i].numberGen;
        if RQPayDocList.list[i].dateGen = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(RQPayDocList.list[i].dateGen);
        Cells[4,i+1] := RQPayDocList.list[i].payOrder;

        Cells[5,i+1] := RQPayDocList.list[i].paymentMethodRefName;
        if RQPayDocList.list[i].accountablePersonRefCode <> Low(Integer) then begin
           Cells[6,i+1] := Format('%s (таб.№ %s)'
           , [RQPayDocList.list[i].accountablePersonRefName
           , RQPayDocList.list[i].accountablePersonRefTabNumber]);
        end;

        LastRow:=i+1;
        sgRQPayDoc.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQPayDoc.Row:=1;
end;

procedure TfrmRQPayDocShow.sgRQPayDocTopLeftChanged(Sender: TObject);
var
  TempRQPayDoc: RQPayDocControllerSoapPort;
  i,CurrentRow: Integer;
  RQPayDocList: RQPayDocShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQPayDoc.TopRow + sgRQPayDoc.VisibleRowCount) = ColCount
  then
    begin
      TempRQPayDoc :=  HTTPRIORQPayDoc as RQPayDocControllerSoapPort;
      CurrentRow:=sgRQPayDoc.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQPayDocFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQPayDocFilter(FilterObject).orderBySQL := 'dategen desc, RQPAYDOC.code desc';
  
  RQPayDocList := TempRQPayDoc.getScrollableFilteredList(RQPayDocFilter(FilterObject),ColCount-1, 100);



  sgRQPayDoc.RowCount:=sgRQPayDoc.RowCount+100;
  LastCount:=High(RQPayDocList.list);
  with sgRQPayDoc do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPayDocList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQPayDocList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if RQPayDocList.list[i].summaGen = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := RQPayDocList.list[i].summaGen.DecimalString;
        Cells[2,i+CurrentRow] := RQPayDocList.list[i].numberGen;
        if RQPayDocList.list[i].dateGen = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDate2String(RQPayDocList.list[i].dateGen);
        Cells[4,i+CurrentRow] := RQPayDocList.list[i].payOrder;
        Cells[5,i+CurrentRow] := RQPayDocList.list[i].paymentMethodRefName;
        if RQPayDocList.list[i].accountablePersonRefCode <> Low(Integer) then begin
           Cells[6,i+CurrentRow] := Format('%s (таб.№ %s)'
           , [RQPayDocList.list[i].accountablePersonRefName
           , RQPayDocList.list[i].accountablePersonRefTabNumber]);
        end;

          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQPayDoc.Row:=CurrentRow-5;
   sgRQPayDoc.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQPayDocShow.sgRQPayDocDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQPayDoc,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQPayDocShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQPayDoc.RowCount-1 do
   for j:=0 to sgRQPayDoc.ColCount-1 do
     sgRQPayDoc.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQPayDocShow.actViewExecute(Sender: TObject);
Var TempRQPayDoc: RQPayDocControllerSoapPort;
begin
 TempRQPayDoc := HTTPRIORQPayDoc as RQPayDocControllerSoapPort;
   try
     RQPayDocObj := TempRQPayDoc.getObject(StrToInt(sgRQPayDoc.Cells[0,sgRQPayDoc.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPayDocEdit:=TfrmRQPayDocEdit.Create(Application, dsView);
  try
    frmRQPayDocEdit.ShowModal;
  finally
    frmRQPayDocEdit.Free;
    frmRQPayDocEdit:=nil;
  end;
end;

procedure TfrmRQPayDocShow.actEditExecute(Sender: TObject);
Var TempRQPayDoc: RQPayDocControllerSoapPort;
begin
 TempRQPayDoc := HTTPRIORQPayDoc as RQPayDocControllerSoapPort;
   try
     RQPayDocObj := TempRQPayDoc.getObject(StrToInt(sgRQPayDoc.Cells[0,sgRQPayDoc.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPayDocEdit:=TfrmRQPayDocEdit.Create(Application, dsEdit);
  try
    if frmRQPayDocEdit.ShowModal= mrOk then
      begin
        //TempRQPayDoc.save(RQPayDocObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQPayDocEdit.Free;
    frmRQPayDocEdit:=nil;
  end;
end;

procedure TfrmRQPayDocShow.actDeleteExecute(Sender: TObject);
Var TempRQPayDoc: RQPayDocControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQPayDoc := HTTPRIORQPayDoc as RQPayDocControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQPayDoc.Cells[0,sgRQPayDoc.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Оплата) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQPayDoc.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQPayDocShow.actInsertExecute(Sender: TObject);
Var TempRQPayDoc: RQPayDocControllerSoapPort;
begin
  TempRQPayDoc := HTTPRIORQPayDoc as RQPayDocControllerSoapPort;
  RQPayDocObj:=RQPayDoc.Create;

   RQPayDocObj.summaGen:= TXSDecimal.Create;
   RQPayDocObj.dateGen:= TXSDate.Create;


  try
    frmRQPayDocEdit:=TfrmRQPayDocEdit.Create(Application, dsInsert);
    try
      if frmRQPayDocEdit.ShowModal = mrOk then
      begin
        if RQPayDocObj<>nil then
            //TempRQPayDoc.add(RQPayDocObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQPayDocEdit.Free;
      frmRQPayDocEdit:=nil;
    end;
  finally
    RQPayDocObj.Free;
  end;
end;

procedure TfrmRQPayDocShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQPayDocShow.actFilterExecute(Sender: TObject);
begin
frmRQPayDocFilterEdit:=TfrmRQPayDocFilterEdit.Create(Application, dsEdit);
  try
    RQPayDocFilterObj := RQPayDocFilter.Create;
    SetNullIntProps(RQPayDocFilterObj);
    SetNullXSProps(RQPayDocFilterObj);

    if frmRQPayDocFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQPayDocFilter.Create;
      FilterObject := RQPayDocFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQPayDocFilterEdit.Free;
    frmRQPayDocFilterEdit:=nil;
  end;
end;

procedure TfrmRQPayDocShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

procedure TfrmRQPayDocShow.ToolButton4Click(Sender: TObject);
var
  TempRQPayDocItem : RQPayDocItemControllerSoapPort;
  f : RQPayDocItemFilter;
begin
 {TempRQPayDocItem := HTTPRIORQPayDocItem as RQPayDocItemControllerSoapPort;
   try
     RQPayDocItemObj := TempRQPayDocItem.getObject(StrToInt(sgRQPayDocItem.Cells[0,sgRQPayDocItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPayDocItemEdit:=TfrmRQPayDocItemEdit.Create(Application, dsEdit);
  try
    if frmRQPayDocItemEdit.ShowModal= mrOk then
      begin
        //TempRQPayDoc.save(RQPayDocObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQPayDocItemEdit.Free;
    frmRQPayDocItemEdit:=nil;
  end;  }

  f := RQPayDocItemFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  f.payDocRef := RQPayDocRef.Create;
  f.payDocRef.code := StrToInt(sgRQPayDoc.Cells[0,sgRQPayDoc.Row]);

  if not Assigned(frmRQPayDocItemShow) then
    frmRQPayDocItemShow := TfrmRQPayDocItemShow.Create(Application, fmChild, f);
  frmRQPayDocItemShow.Label3.Caption := sgRQPayDoc.Cells[2,sgRQPayDoc.Row];
  frmRQPayDocItemShow.Label5.Caption := sgRQPayDoc.Cells[3,sgRQPayDoc.Row];

 frmRQPayDocItemShow.Show;
end;

end.