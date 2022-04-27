
unit ShowRQPlanPay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQPlanPayController, AdvObj ;


type
  TfrmRQPlanPayShow = class(TChildForm)  
  HTTPRIORQPlanPay: THTTPRIO;
    ImageList1: TImageList;
    sgRQPlanPay: TAdvStringGrid;
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
    N5: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    act_make_created: TAction;
    act_make_unCreated: TAction;
    act_make_closed: TAction;
    act_make_unClosed: TAction;
    act_EditDateGenRQPlanPay: TAction;
    ppEditDateGenRQPlanPay: TMenuItem;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgRQPlanPayTopLeftChanged(Sender: TObject);
procedure sgRQPlanPayDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure act_make_createdExecute(Sender: TObject);
    procedure act_make_unCreatedExecute(Sender: TObject);
    procedure act_make_closedExecute(Sender: TObject);
    procedure act_make_unClosedExecute(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure act_EditDateGenRQPlanPayExecute(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // RQPlanPayObj: RQPlanPay;
 // RQPlanPayFilterObj: RQPlanPayFilter;

  
implementation

uses Main, EditRQPlanPay, EditRQPlanPayFilter, ENConsts, EditDateGenRQPlanPay,
  RQBillItemController, overPaymentByCodeDDS;


{$R *.dfm}

var
  //frmRQPlanPayShow : TfrmRQPlanPayShow;
  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQPlanPayHeaders: array [1..8] of String =
        ( 'Код'
          ,'Номер'
          ,'Дата ведомости'
          ,'Користувач, що вніс зміни'
          ,'Дата останньої зміни'
          ,'Вид реєстра'
          ,'Статус'
          ,'Дата формування реєстру'
        );
   

procedure TfrmRQPlanPayShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQPlanPayShow:=nil;
    inherited;
  end;


procedure TfrmRQPlanPayShow.FormShow(Sender: TObject);
var
  TempRQPlanPay: RQPlanPayControllerSoapPort;
  i: Integer;
  RQPlanPayList: RQPlanPayShortList;
  begin
  SetGridHeaders(RQPlanPayHeaders, sgRQPlanPay.ColumnHeaders);
  ColCount:=100;
  TempRQPlanPay :=  HTTPRIORQPlanPay as RQPlanPayControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQPlanPayFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;


  RQPlanPayFilter(FilterObject).orderBySQL := ' RQPLANPAY.DATEGEN desc, RQPLANPAY.CODE desc ';

  RQPlanPayList := TempRQPlanPay.getScrollableFilteredList(RQPlanPayFilter(FilterObject),0,ColCount);


  LastCount:=High(RQPlanPayList.list);

  if LastCount > -1 then
     sgRQPlanPay.RowCount:=LastCount+2
  else
     sgRQPlanPay.RowCount:=2;

   with sgRQPlanPay do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPlanPayList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQPlanPayList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQPlanPayList.list[i].numberDoc;
        if RQPlanPayList.list[i].dateGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(RQPlanPayList.list[i].dateGen);
        Cells[3,i+1] := RQPlanPayList.list[i].userGen;

        if RQPlanPayList.list[i].dateEdit = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDateTimeWithDate2String(RQPlanPayList.list[i].dateEdit);

        Cells[5,i+1] := RQPlanPayList.list[i].kindRefName;
        Cells[6,i+1] := RQPlanPayList.list[i].statusRefName;

        if RQPlanPayList.list[i].dateCreateItem = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := XSDateTimeWithDate2String(RQPlanPayList.list[i].dateCreateItem);

        LastRow:=i+1;
        sgRQPlanPay.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQPlanPay.Row:=1;
end;

procedure TfrmRQPlanPayShow.PopupMenu1Popup(Sender: TObject);
var
TempRQPlanPay: RQPlanPayControllerSoapPort;
plpayObj  : RQPlanPay;
begin

  TempRQPlanPay :=  HTTPRIORQPlanPay as RQPlanPayControllerSoapPort;
  plpayObj := TempRQPlanPay.getObject(StrToInt(sgRQPlanPay.Cells[0,sgRQPlanPay.Row]));


  act_make_created.Enabled :=
                          (
                             plpayObj.statusRef.code = ENConsts.RQPLANPAYSTATUS_GOOD

                           );

  act_make_unCreated.Enabled := ( plpayObj.statusRef.code = ENConsts.RQPLANPAYSTATUS_CREATED );

  act_make_closed.Enabled := ( plpayObj.statusRef.code = ENConsts.RQPLANPAYSTATUS_CREATED );

  act_make_unClosed.Enabled := ( plpayObj.statusRef.code = ENConsts.RQPLANPAYSTATUS_CLOSED );

  act_EditDateGenRQPlanPay.Enabled := ( plpayObj.statusRef.code = ENConsts.RQPLANPAYSTATUS_GOOD );

end;

procedure TfrmRQPlanPayShow.sgRQPlanPayTopLeftChanged(Sender: TObject);
var
  TempRQPlanPay: RQPlanPayControllerSoapPort;
  i,CurrentRow: Integer;
  RQPlanPayList: RQPlanPayShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQPlanPay.TopRow + sgRQPlanPay.VisibleRowCount) = ColCount
  then
    begin
      TempRQPlanPay :=  HTTPRIORQPlanPay as RQPlanPayControllerSoapPort;
      CurrentRow:=sgRQPlanPay.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQPlanPayFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQPlanPayList := TempRQPlanPay.getScrollableFilteredList(RQPlanPayFilter(FilterObject),ColCount-1, 100);



  sgRQPlanPay.RowCount:=sgRQPlanPay.RowCount+100;
  LastCount:=High(RQPlanPayList.list);
  with sgRQPlanPay do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPlanPayList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQPlanPayList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQPlanPayList.list[i].numberDoc;
        if RQPlanPayList.list[i].dateGen = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(RQPlanPayList.list[i].dateGen);
        Cells[3,i+CurrentRow] := RQPlanPayList.list[i].userGen;
        if RQPlanPayList.list[i].dateEdit = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := XSDateTimeWithDate2String(RQPlanPayList.list[i].dateEdit);

          Cells[5,i+CurrentRow] := RQPlanPayList.list[i].kindRefName;
          Cells[6,i+CurrentRow] := RQPlanPayList.list[i].statusRefName;

          if RQPlanPayList.list[i].dateCreateItem = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := XSDateTimeWithDate2String(RQPlanPayList.list[i].dateCreateItem);

          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQPlanPay.Row:=CurrentRow-5;
   sgRQPlanPay.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQPlanPayShow.sgRQPlanPayDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQPlanPay,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQPlanPayShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQPlanPay.RowCount-1 do
   for j:=0 to sgRQPlanPay.ColCount-1 do
     sgRQPlanPay.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQPlanPayShow.actViewExecute(Sender: TObject);
Var TempRQPlanPay: RQPlanPayControllerSoapPort;
begin
 TempRQPlanPay := HTTPRIORQPlanPay as RQPlanPayControllerSoapPort;
   try
     RQPlanPayObj := TempRQPlanPay.getObject(StrToInt(sgRQPlanPay.Cells[0,sgRQPlanPay.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPlanPayEdit:=TfrmRQPlanPayEdit.Create(Application, dsView);
  try
    frmRQPlanPayEdit.ShowModal;
  finally
    frmRQPlanPayEdit.Free;
    frmRQPlanPayEdit:=nil;
  end;
end;

procedure TfrmRQPlanPayShow.act_EditDateGenRQPlanPayExecute(Sender: TObject);
var TempRQPlanPay: RQPlanPayControllerSoapPort;
begin
if Application.MessageBox(PChar('Ви дійсно бажаєте змінити дату відомості ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    frmEditDateGenRQPlanPay:= TfrmEditDateGenRQPlanPay.Create(Application, dsInsert);

    try
        frmEditDateGenRQPlanPay.planPayCode:= StrToInt(sgRQPlanPay.Cells[0,sgRQPlanPay.Row]);


         if frmEditDateGenRQPlanPay.ShowModal = mrOk then
            UpdateGrid(Sender);

      finally
        frmEditDateGenRQPlanPay.Free;
        frmEditDateGenRQPlanPay:=nil;

      end;
  end;
end;

procedure TfrmRQPlanPayShow.act_make_closedExecute(Sender: TObject);
var TempRQPlanPay: RQPlanPayControllerSoapPort;
begin
if Application.MessageBox(PChar('Ви дійсно бажаєте затвердити реєстр ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
   TempRQPlanPay := HTTPRIORQPlanPay as RQPlanPayControllerSoapPort;
   TempRQPlanPay.approve( StrToInt(sgRQPlanPay.Cells[0,sgRQPlanPay.Row]) );
   UpdateGrid(Sender);
  end;
end;

procedure TfrmRQPlanPayShow.act_make_createdExecute(Sender: TObject);
var TempRQPlanPay: RQPlanPayControllerSoapPort;
    RQBillItemList: RQBillItemShortList;
    overCount  , i : Integer;
begin
 if Application.MessageBox(PChar('Ви дійсно бажаєте перевести реєстр в статус "Складений" ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempRQPlanPay := HTTPRIORQPlanPay as RQPlanPayControllerSoapPort;

    RQBillItemList:=  TempRQPlanPay.checkReestrForOverPayment(StrToInt(sgRQPlanPay.Cells[0,sgRQPlanPay.Row]));

    if(RQBillItemList.totalCount > 0) then
      begin
          if Application.MessageBox(PChar('Складання неможливе... При сплаті данного реєстра відбудеться переплата по кодам ДДС які перераховані на формі ! '),
                    PChar('Внимание !'),MB_ICONQUESTION
                    //+MB_OKCANCEL
                    +MB_DEFBUTTON2)=IDOK then
                    begin
                          frmoverPaymentByCodeDDS :=  TfrmoverPaymentByCodeDDS.Create(Application, dsInsert);


                        overCount:=High(RQBillItemList.list);
                        if overCount > -1 then
                          frmoverPaymentByCodeDDS.sgOverPayment.RowCount:=overCount+2
                        else
                          frmoverPaymentByCodeDDS.sgOverPayment.RowCount:=2;

                         with frmoverPaymentByCodeDDS.sgOverPayment do
                          for i := 0 to overCount do
                            begin
                              Application.ProcessMessages;

                              Cells[0,i+1] := '';
                              Cells[1,i+1] := RQBillItemList.list[i].measurementNameTxt;
                              Cells[2,i+1] := RQBillItemList.list[i].materialNameTxt;

                              Cells[3,i+1] := RQBillItemList.list[i].countGen.DecimalString;
                              Cells[4,i+1] := RQBillItemList.list[i].countFact.DecimalString;
                              Cells[5,i+1] := RQBillItemList.list[i].priceWithoutNds.DecimalString;
                              Cells[6,i+1] := RQBillItemList.list[i].nds.DecimalString;

                            end;

                          try
                            frmoverPaymentByCodeDDS.ShowModal;
                          finally
                            frmoverPaymentByCodeDDS.Free;
                          end;
                    end;
      end
      else
      begin
       TempRQPlanPay.created( StrToInt(sgRQPlanPay.Cells[0,sgRQPlanPay.Row]) );
       UpdateGrid(Sender);
      end;



  end;
end;

procedure TfrmRQPlanPayShow.act_make_unClosedExecute(Sender: TObject);
var TempRQPlanPay: RQPlanPayControllerSoapPort;
begin
if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити затвердження реєстру ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
   TempRQPlanPay := HTTPRIORQPlanPay as RQPlanPayControllerSoapPort;
   TempRQPlanPay.unApprove( StrToInt(sgRQPlanPay.Cells[0,sgRQPlanPay.Row]) );
   UpdateGrid(Sender);
  end;
end;
procedure TfrmRQPlanPayShow.act_make_unCreatedExecute(Sender: TObject);
var TempRQPlanPay: RQPlanPayControllerSoapPort;
begin
if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити перевод реєстру в статус "Складений" ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
   TempRQPlanPay := HTTPRIORQPlanPay as RQPlanPayControllerSoapPort;
   TempRQPlanPay.unCreated( StrToInt(sgRQPlanPay.Cells[0,sgRQPlanPay.Row]) );
   UpdateGrid(Sender);
  end;
end;

procedure TfrmRQPlanPayShow.actEditExecute(Sender: TObject);
Var TempRQPlanPay: RQPlanPayControllerSoapPort;
begin
 TempRQPlanPay := HTTPRIORQPlanPay as RQPlanPayControllerSoapPort;
   try
     RQPlanPayObj := TempRQPlanPay.getObject(StrToInt(sgRQPlanPay.Cells[0,sgRQPlanPay.Row]));
   except
   on EConvertError do Exit;
  end;


  if ((RQPlanPayObj.statusRef.code <> RQPLANPAYSTATUS_GOOD)
       and
       (RQPlanPayObj.statusRef.code <> RQPLANPAYSTATUS_CREATED)
         ) then
  begin
      Application.MessageBox(PChar('Цей реєстр не редагується- статус "Затверджений" або "Оплати рознесені"   ' ),
                    PChar('Увага !'),MB_ICONWARNING );
      Exit;
  end;

  frmRQPlanPayEdit:=TfrmRQPlanPayEdit.Create(Application, dsEdit);
  try
    if frmRQPlanPayEdit.ShowModal= mrOk then
      begin
        //TempRQPlanPay.save(RQPlanPayObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQPlanPayEdit.Free;
    frmRQPlanPayEdit:=nil;
  end;
end;

procedure TfrmRQPlanPayShow.actDeleteExecute(Sender: TObject);
Var TempRQPlanPay: RQPlanPayControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQPlanPay := HTTPRIORQPlanPay as RQPlanPayControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQPlanPay.Cells[0,sgRQPlanPay.Row]);
   except
   on EConvertError do Exit;
  end;

     RQPlanPayObj := TempRQPlanPay.getObject(StrToInt(sgRQPlanPay.Cells[0,sgRQPlanPay.Row]));
  if ((RQPlanPayObj.statusRef.code <> RQPLANPAYSTATUS_GOOD)
         ) then
  begin
      Application.MessageBox(PChar('Видалення неможливе. Статус не "Черновий" !!! ' ),
                    PChar('Увага !'),MB_ICONWARNING );
      Exit;
  end;

  if Application.MessageBox(PChar('Вы действительно хотите удалить (Реестр плановых оплат) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQPlanPay.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQPlanPayShow.actInsertExecute(Sender: TObject);
// Var TempRQPlanPay: RQPlanPayControllerSoapPort; 
begin
  // TempRQPlanPay := HTTPRIORQPlanPay as RQPlanPayControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQPlanPayObj:=RQPlanPay.Create;

   //RQPlanPayObj.dateGen:= TXSDate.Create;
   //RQPlanPayObj.dateEdit:= TXSDate.Create;


  try
    frmRQPlanPayEdit:=TfrmRQPlanPayEdit.Create(Application, dsInsert);
    try
      if frmRQPlanPayEdit.ShowModal = mrOk then
      begin
        if RQPlanPayObj<>nil then
            //TempRQPlanPay.add(RQPlanPayObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQPlanPayEdit.Free;
      frmRQPlanPayEdit:=nil;
    end;
  finally
    RQPlanPayObj.Free;
  end;
end;

procedure TfrmRQPlanPayShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQPlanPayShow.actFilterExecute(Sender: TObject);
begin
frmRQPlanPayFilterEdit:=TfrmRQPlanPayFilterEdit.Create(Application, dsInsert);
  try
    RQPlanPayFilterObj := RQPlanPayFilter.Create;
    SetNullIntProps(RQPlanPayFilterObj);
    SetNullXSProps(RQPlanPayFilterObj);

    if frmRQPlanPayFilterEdit.ShowModal = mrOk then
    begin
      FilterObject := RQPlanPayFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQPlanPayFilterEdit.Free;
    frmRQPlanPayFilterEdit:=nil;
  end;
end;

procedure TfrmRQPlanPayShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.