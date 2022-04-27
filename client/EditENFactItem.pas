
unit EditENFactItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanWorkItemController,
  TB2Item, TB2Dock, TB2Toolbar ;

type
  TfrmENFactItemEdit = class(TDialogForm)

    lblCountGen : TLabel;
    edtCountGen: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;


  HTTPRIOENPlanWorkItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    spbEPKard: TSpeedButton;
    edtKartiName: TEdit;
    lblKarta: TLabel;
    HTTPRIOKarti: THTTPRIO;
    HTTPRIOENEstimateItem: THTTPRIO;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    pmActions: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    lblMeasure: TLabel;
    HTTPRIOENElement: THTTPRIO;
    HTTPRIOENPlanWork: THTTPRIO;
    Label1: TLabel;
    edtKartiNum: TEdit;
    pcEstimate: TPageControl;
    tsMaterials: TTabSheet;
    tsWorkers: TTabSheet;
    tsTransports: TTabSheet;
    tbActions: TTBToolbar;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem47: TTBItem;
    TBItem7: TTBItem;
    TBItem46: TTBItem;
    lblEstimateItem: TLabel;
    sgENEstimateItem: TAdvStringGrid;
    sgENTransportItem: TAdvStringGrid;
    sgENHumenItem: TAdvStringGrid;
    HTTPRIOENHumenItem: THTTPRIO;
    HTTPRIOENTransportItem: THTTPRIO;
    HTTPRIOTKTechCardPWI: THTTPRIO;
    lblNormTime: TLabel;
    edtNormTime: TEdit;
    edtParentCount: TEdit;
    HTTPRIOENPlanCorrectHistory: THTTPRIO;
    Label2: TLabel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbEPKardClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);

    procedure UpdateGrid(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure pcEstimateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENFactItemEdit: TfrmENFactItemEdit;
  ENPlanWorkItemObj: ENPlanWorkItem;

implementation

uses
 ENEstimateItemController, ENConsts,
  EditENEstimateItem, ENElementController, ENPlanWorkController,
  DMReportsUnit, TKTechCardController, ShowTKTechCard,
  ENHumenItemController, EditENHumenItem, ENTransportItemController,
  EditENTransportItem, ENPlanCorrectHistoryController,
  EditENFactEstimateItem;


{uses  
    EnergyproController, EnergyproController2, ENPlanWorkItemController  ;
}
{$R *.dfm}

const
  ENEstimateItemHeaders: array [1..6] of String =
        ( 'Код'
          ,'Матеріал'
          ,'кількість запланована'
          ,'кількість ФАКТИЧНА'
          ,'од. виміру'
          ,'тип строки кошторису'
        );

  ENHumenItemHeaders: array [1..10] of String =
        ( 'Код'
          ,'Посада нормативна'
          ,'Посада штатна'
          ,'Робітник'
          ,'норма часу нормативна'
          ,'норма часу скорегована'
          ,'Ціна нормачасу'
          ,'Вартість нормочасу'
          ,'пользователь внесший изменение'
          ,'дата последнего изменения'
        );
        
   ENTransportItemHeaders: array [1..10] of String =
        ( 'Код'
          ,'Транспорт нормативний'
          ,'Транспорт штатний'
          ,'Робітник'
          ,'норма часу нормативна'
          ,'норма часу скорегована'
          ,'Ціна нормачасу'
          ,'Вартість нормочасу'
          ,'пользователь внесший изменение'
          ,'дата последнего изменения'
        );

var
  eiColCount, eiLastCount: Integer;
  eiLastRow: Integer = 1;
  estimateItemFilter: ENEstimateItemFilter;
  humenItemFilter : ENHumenItemFilter;
  transportItemFilter : ENTransportItemFilter;

procedure TfrmENFactItemEdit.FormShow(Sender: TObject);
var
  kFilter : TKTechCardFilter;
  kList : TKTechCardShortList;
  kObj : TKTechCard;
  TempKarti: TKTechCardControllerSoapPort;

  TempENPlanCorrectHistory : ENPlanCorrectHistoryControllerSoapPort;
  ENPlanCorrectHistoryList : ENPlanCorrectHistoryShortList;
  corrFilter : ENPlanCorrectHistoryFilter;

  TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
  pwiFilter : ENPlanWorkItemFilter;
  pwiList : ENPlanWorkItemShortList;
begin

  if (DialogState = dsView) or (DialogState = dsEdit) then
  begin
     TempENPlanCorrectHistory :=  HTTPRIOENPlanCorrectHistory as ENPlanCorrectHistoryControllerSoapPort;
      //if corrFilterObject = nil then
      begin
         corrFilter := ENPlanCorrectHistoryFilter.Create;
         SetNullIntProps(corrFilter);
         SetNullXSProps(corrFilter);
      end;

      corrFilter.planNewRef := ENPlanWorkRef.Create;
      corrFilter.planNewRef.code :=  ENPlanWorkItemObj.planRef.code;

      //corrFilterObject.conditionSQL := ' planoldrefcode in (select ph.planrefcode from enplancorrecthistory ph where ph.plannewrefcode = '+ IntToStr(ENPlanWorkObj.code) +')';

      ENPlanCorrectHistoryList := TempENPlanCorrectHistory.getScrollableFilteredList(corrFilter,0,-1);
      if  ENPlanCorrectHistoryList.totalCount > 0 then
      begin
         pwiFilter := ENPlanWorkItemFilter.Create;
         SetNullXSProps(pwiFilter);
         SetNullIntProps(pwiFilter);
         pwiFilter.planRef := ENPlanWorkRef.Create;
         pwiFilter.planRef.code := ENPlanCorrectHistoryList.list[0].planOldRefCode;

         pwiFilter.kartaRef := TKTechCardRef.Create;
         pwiFilter.kartaRef.code :=  ENPlanWorkItemObj.kartaRef.code;

         TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
         pwiList := TempENPlanWorkItem.getScrollableFilteredList(pwiFilter,0,-1);
         if pwiList.totalCount > 0 then
         begin
             edtParentCount.Text := pwiList.list[0].countGen.DecimalString;
         end;

      end;

   end;


  pcEstimate.ActivePage := tsMaterials;
  
  DisableControls([edtKartiName, edtKartiNum, edtNormTime]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DisableControls([edtKartiName]);
    DenyBlankValues([
      edtKartiName,
      edtCountGen
     ]);
   end;

  SetFloatStyle(edtCountGen); 
  HideControls([lblEstimateItem, sgENEstimateItem, tbActions], (DialogState = dsInsert));

  if DialogState = dsEdit then
  begin
    DisableControls([spbEPKard]);
  end;


  if DialogState = dsView then
  begin
    spbEPKard.Enabled := false;
    DisableActions([actInsert, actEdit, actDelete]);
  end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    if ( ENPlanWorkItemObj.countGen <> nil ) then
       edtCountGen.Text := ENPlanWorkItemObj.countGen.decimalString
    else
       edtCountGen.Text := ''; 
    edtCommentGen.Text := ENPlanWorkItemObj.commentGen;

{    edtUserGen.Text := ENPlanWorkItemObj.userGen;
      if ENPlanWorkItemObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENPlanWorkItemObj.dateEdit.Year,ENPlanWorkItemObj.dateEdit.Month,ENPlanWorkItemObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;
}
     if ENPlanWorkItemObj.kartaRef.code > Low(Integer)then
     begin
           //try
             TempKarti :=  HTTPRIOKarti as TKTechCardControllerSoapPort;
             kObj := TempKarti.getObject(ENPlanWorkItemObj.kartaRef.code);
             edtKartiName.Text := kObj.name;
             edtKartiNum.Text :=  kObj.techKartNumber;
             
             if kObj.normOfTime <> nil then
                edtNormTime.Text := kObj.normOfTime.DecimalString
             else
                edtNormTime.Text := 'нет в нормативе ;)';

           //finally
             //eFilter.Free;
           //end;
     end
     else
         edtKartiName.Text := '';

     UpdateGrid(Sender);
  end;

end;



procedure TfrmENFactItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
    TempENElement: ENElementControllerSoapPort;
    TempENPlanWork: ENPlanWorkControllerSoapPort;
    element : ENElement;
    plan : ENPlanWork;
    pwiF : ENPlanWorkItemFilter;
    pwiList : ENPlanWorkItemShortList;
    err : String;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtKartiName,
      edtCountGen
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;


     if (ENPlanWorkItemObj.countGen = nil ) then
       ENPlanWorkItemObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       ENPlanWorkItemObj.countGen.decimalString := edtCountGen.Text 
     else
       ENPlanWorkItemObj.countGen := nil;

     ENPlanWorkItemObj.commentGen := edtCommentGen.Text; 
{
     ENPlanWorkItemObj.userGen := edtUserGen.Text;

     if ENPlanWorkItemObj.dateEdit = nil then
        ENPlanWorkItemObj.dateEdit := TXSDate.Create;
      ENPlanWorkItemObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
}


    // определим тип элемента по коду
    // и вызовм НУЖНЫЙ метод ... - чтоб левые юзера не планировали на правые обьекты
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
    plan := TempENPlanWork.getObject(ENPlanWorkItemObj.planRef.code);

    TempENElement := HTTPRIOENElement as ENElementControllerSoapPort;
    element := TempENElement.getObject(plan.elementRef.code);


    if DialogState = dsInsert then
    begin

      // проверить нет ли такой работы в плане ....
      pwiF := ENPlanWorkItemFilter.Create;
      SetNullIntProps(pwiF);
      SetNullXSProps(pwiF);
      pwiF.planRef := ENPlanWorkRef.Create;
      pwiF.planRef.code := ENPlanWorkItemObj.planRef.code;
      pwiF.kartaRef := TKTechCardRef.Create;
      pwiF.kartaRef.code :=  ENPlanWorkItemObj.kartaRef.code;
      pwiList := TempENPlanWorkItem.getScrollableFilteredList(pwiF,0,-1);
      if ( pwiList.totalCount  > 0 ) then
      begin
          err := 'На цей план вже є робота з кодом ' + pwiList.list[0].kartaNum +  ' у кількості ' + pwiList.list[0].countGen.DecimalString;
          Application.MessageBox(PChar(err) , PChar('Помилка !!!'), MB_ICONERROR);
          ModalResult := mrNone;
          exit;
      end;

      ENPlanWorkItemObj.code:=low(Integer);
      {
      case element.typeRef.code of
        1,2,3 : TempENPlanWorkItem.addBySRS(ENPlanWorkItemObj);
        5 : TempENPlanWorkItem.addBySVES(ENPlanWorkItemObj);
        6 : TempENPlanWorkItem.addBySPS(ENPlanWorkItemObj);
        else
        begin
          Application.MessageBox(PChar('Невідомий тип Об"єкту !!!'), PChar('Помилка'), MB_ICONERROR);
          exit;
        end;
       end;
       }
       TempENPlanWorkItem.add(ENPlanWorkItemObj);
    end
    else
    if DialogState = dsEdit then
    begin
    TempENPlanWorkItem.save(ENPlanWorkItemObj);
    {
      case element.typeRef.code of
        1,2,3 : TempENPlanWorkItem.saveBySRS(ENPlanWorkItemObj);
        5 : TempENPlanWorkItem.saveBySVES(ENPlanWorkItemObj);
        6 : TempENPlanWorkItem.saveBySPS(ENPlanWorkItemObj);
        else
        begin
          Application.MessageBox(PChar('Невідомий тип Об"єкту !!!'), PChar('Помилка'), MB_ICONERROR);
          exit;
        end;
      end;
     }
    end;
  end;
end;


procedure TfrmENFactItemEdit.spbEPKardClick(Sender: TObject);
var
   frmKartiShow: TfrmTKTechCardShow;
   TempTKTechCard: TKTechCardControllerSoapPort;
   tcObj: TKTechCard;
begin
   frmKartiShow:=TfrmTKTechCardShow.Create(Application,fmNormal);
   try
      with frmKartiShow do
      begin
        // NET-73 Закрываем любое редактирование техкарт (оставляем только просмотр)
        // (для редактирования есть отдельный клиент!)
        DisableActions([actInsert, actEdit, actDelete]);

        if ShowModal = mrOk then
        begin
            try
               if ENPlanWorkItemObj.kartaRef = nil then ENPlanWorkItemObj.kartaRef := TKTechCardRef.Create();

               TempTKTechCard := frmENFactItemEdit.HTTPRIOTKTechCardPWI as TKTechCardControllerSoapPort;
               tcObj := TempTKTechCard.getObject(StrToInt(GetReturnValue(sgTKTechCard,0)));

              // ENPlanWorkObj.status.code := StrToInt(GetReturnValue(sgENPlanWorkStatus,0));
               ENPlanWorkItemObj.kartaRef.code := tcObj.code; //StrToInt(GetReturnValue(sgTKTechCard,0));
               edtKartiName.Text := tcObj.name; //GetReturnValue(sgTKTechCard,2);
               edtKartiNum.Text := tcObj.techKartNumber; //GetReturnValue(sgTKTechCard,1);
               lblMeasure.Caption := 'Вимірювач : ' + tcObj.meter + ' /  Од.виміру : ' + tcObj.measurement.name;

               if tcObj.normOfTime <> nil then
                  edtNormTime.Text := tcObj.normOfTime.DecimalString
               else
                  edtNormTime.Text := 'нет в нормативе ;)';

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmKartiShow.Free;
   end;
end;

procedure TfrmENFactItemEdit.actViewExecute(Sender: TObject);
Var TempENEstimateItem: ENEstimateItemControllerSoapPort;
     TempENHumenItem: ENHumenItemControllerSoapPort;
     TempENTransportItem: ENTransportItemControllerSoapPort;
begin
  if pcEstimate.ActivePage = tsMaterials then
  begin
    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
    try
      ENEstimateItemObj := TempENEstimateItem.getObject(StrToInt(sgENEstimateItem.Cells[0, sgENEstimateItem.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENEstimateItemEdit := TfrmENEstimateItemEdit.Create(Application, dsView);
    try
      //frmENEstimateItemEdit.DisableControls([frmENLine04Edit.edtENSubstation04Name, frmENLine04Edit.spbENSubstation04]);
      if frmENEstimateItemEdit.ShowModal= mrOk then
      begin
        //TempENLine04.save(ENLine04Obj);
        //UpdateGrid(Sender);
      end;
    finally
      frmENEstimateItemEdit.Free;
      frmENEstimateItemEdit := nil;
    end;
  end /// workers
  else
  if pcEstimate.ActivePage = tsWorkers then
  begin
     TempENHumenItem := HTTPRIOENHumenItem as ENHumenItemControllerSoapPort;
     try
       ENHumenItemObj := TempENHumenItem.getObject(StrToInt(sgENHumenItem.Cells[0,sgENHumenItem.Row]));
     except
     on EConvertError do Exit;
    end;
    frmENHumenItemEdit:=TfrmENHumenItemEdit.Create(Application, dsView);
    try
      frmENHumenItemEdit.ShowModal;
    finally
      frmENHumenItemEdit.Free;
      frmENHumenItemEdit:=nil;
    end;
  end // materials
  else
  if pcEstimate.ActivePage = tsTransports then
  begin
     TempENTransportItem := HTTPRIOENTransportItem as ENTransportItemControllerSoapPort;
     try
       ENTransportItemObj := TempENTransportItem.getObject(StrToInt(sgENTransportItem.Cells[0,sgENTransportItem.Row]));
     except
     on EConvertError do Exit;
    end;
    frmENTransportItemEdit:=TfrmENTransportItemEdit.Create(Application, dsView);
    try
      frmENTransportItemEdit.ShowModal;
    finally
      frmENTransportItemEdit.Free;
      frmENTransportItemEdit:=nil;
    end;
  end;

end;

procedure TfrmENFactItemEdit.UpdateGrid(Sender: TObject);
Var i, j: Integer;
    TempENEstimateItem: ENEstimateItemControllerSoapPort;
    ENEstimateItemList: ENEstimateItemShortList;

    TempENHumenItem: ENHumenItemControllerSoapPort;
    ENHumenItemList: ENHumenItemShortList;
begin
if pcEstimate.ActivePage = tsMaterials then
begin
  for i:=1 to sgENEstimateItem.RowCount-1 do
    for j:=0 to sgENEstimateItem.ColCount-1 do
      sgENEstimateItem.Cells[j,i]:='';
end
else
if pcEstimate.ActivePage = tsWorkers then
begin
  for i:=1 to sgENHumenItem.RowCount-1 do
    for j:=0 to sgENHumenItem.ColCount-1 do
      sgENHumenItem.Cells[j,i]:='';
end;

if pcEstimate.ActivePage = tsTransports then
begin
  for i:=1 to sgENTransportItem.RowCount-1 do
    for j:=0 to sgENTransportItem.ColCount-1 do
      sgENTransportItem.Cells[j,i]:='';
end;

pcEstimateChange(Sender);


end;

procedure TfrmENFactItemEdit.actInsertExecute(Sender: TObject);
var TempENEstimateItem: ENEstimateItemControllerSoapPort;
TempENHumenItem: ENHumenItemControllerSoapPort;
TempENTransportItem: ENTransportItemControllerSoapPort;
plan : ENPlanWork;
begin

if pcEstimate.ActivePage = tsMaterials then
begin
  TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
  ENEstimateItemObj := ENEstimateItem.Create;

  ENEstimateItemObj.countGen := TXSDecimal.Create;
  ENEstimateItemObj.countFact := TXSDecimal.Create;
  ENEstimateItemObj.dateEdit := TXSDate.Create;

  ENEstimateItemObj.planRef := ENPlanWorkRef.Create;
  ENEstimateItemObj.planRef.code := ENPlanWorkItemObj.planRef.code;

  ENEstimateItemObj.planItemRef := ENPlanWorkItemRef.Create;
  ENEstimateItemObj.planItemRef.code := ENPlanWorkItemObj.code;



  try
    frmENEstimateItemEdit := TfrmENEstimateItemEdit.Create(Application, dsInsert);
    frmENEstimateItemEdit.ENPlanWorkCode := ENPlanWorkItemObj.planRef.code; //ENPlanWorkObj.code;
    frmENEstimateItemEdit.ENPlanWorkItemCode := ENPlanWorkItemObj.code;
    frmENEstimateItemEdit.ENPlanWorkItemName := edtKartiName.Text;

    //frmENEstimateItemEdit.rgPlans.ItemIndex := 1;
    DisableControls([frmENEstimateItemEdit.edtPlanItem, frmENEstimateItemEdit.spbPlanItem ]);

    try
      if frmENEstimateItemEdit.ShowModal = mrOk then
      begin
        if ENEstimateItemObj <> nil then
          //TempENEstimateItem.add(ENEstimateItemObj);
          UpdateGrid(Sender);
      end;
    finally
      frmENEstimateItemEdit.Free;
      frmENEstimateItemEdit := nil;
    end;
  finally
    ENEstimateItemObj.Free;
  end;
end // add MATERIALS
else
// begin workers
if pcEstimate.ActivePage = tsWorkers then
begin
  TempENHumenItem := HTTPRIOENHumenItem as ENHumenItemControllerSoapPort;
  ENHumenItemObj:=ENHumenItem.Create;

   ENHumenItemObj.countGen:= TXSDecimal.Create;
   ENHumenItemObj.countFact:= TXSDecimal.Create;
   ENHumenItemObj.price:= TXSDecimal.Create;
   ENHumenItemObj.cost:= TXSDecimal.Create;
   ENHumenItemObj.dateEdit:= TXSDate.Create;

   ENHumenItemObj.planRef := ENPlanWorkRef.Create;
   ENHumenItemObj.planRef.code := ENPlanWorkItemObj.planRef.code;

   ENHumenItemObj.planItemRef := ENPlanWorkItemRef.Create;
   ENHumenItemObj.planItemRef.code := ENPlanWorkItemObj.code;

  try
    frmENHumenItemEdit:=TfrmENHumenItemEdit.Create(Application, dsInsert);
    frmENHumenItemEdit.edtCountGen.Text := '0';
    DisableControls([frmENHumenItemEdit.edtCountGen]);
    try
      if frmENHumenItemEdit.ShowModal = mrOk then
      begin
        if ENHumenItemObj<>nil then
            //TempENHumenItem.add(ENHumenItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENHumenItemEdit.Free;
      frmENHumenItemEdit:=nil;
    end;
  finally
    ENHumenItemObj.Free;
  end;
end /// end workers
else
if pcEstimate.ActivePage = tsTransports then
begin
 TempENTransportItem := HTTPRIOENTransportItem as ENTransportItemControllerSoapPort;
  ENTransportItemObj:=ENTransportItem.Create;

   ENTransportItemObj.countWorkGen:= TXSDecimal.Create;
   ENTransportItemObj.countWorkFact:= TXSDecimal.Create;
   ENTransportItemObj.price:= TXSDecimal.Create;
   ENTransportItemObj.cost:= TXSDecimal.Create;
   ENTransportItemObj.dateEdit:= TXSDate.Create;

   ENTransportItemObj.planRef := ENPlanWorkRef.Create;
   ENTransportItemObj.planRef.code := ENPlanWorkItemObj.planRef.code;

   ENTransportItemObj.planItemRef := ENPlanWorkItemRef.Create;
   ENTransportItemObj.planItemRef.code := ENPlanWorkItemObj.code;

  try
    frmENTransportItemEdit:=TfrmENTransportItemEdit.Create(Application, dsInsert);
    frmENTransportItemEdit.edtCountGen.Text := '0';
    DisableControls([frmENTransportItemEdit.edtCountGen]);

    plan := DMReports.getPlanByCode(ENPlanWorkItemObj.planRef.code);
    ENTransportItemObj.distanceTo := TXSDecimal.Create;
    ENTransportItemObj.distanceTo.DecimalString := plan.distanceTo.DecimalString;
    ENTransportItemObj.distanceAlong := TXSDecimal.Create;
    ENTransportItemObj.distanceAlong.DecimalString := plan.distanceAlong.DecimalString;

    try
      if frmENTransportItemEdit.ShowModal = mrOk then
      begin
        if ENTransportItemObj<>nil then
            //TempENHumenItem.add(ENHumenItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTransportItemEdit.Free;
      frmENTransportItemEdit:=nil;
    end;
  finally
    ENTransportItemObj.Free;
  end;
end; /// transporttttttttttttt



end;

procedure TfrmENFactItemEdit.actEditExecute(Sender: TObject);
var TempENEstimateItem: ENEstimateItemControllerSoapPort;
TempENHumenItem: ENHumenItemControllerSoapPort;
TempENTransportItem: ENTransportItemControllerSoapPort;
begin

if pcEstimate.ActivePage = tsMaterials then
begin
  TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
  try
    ENEstimateItemObj := TempENEstimateItem.getObject(StrToInt(sgENEstimateItem.Cells[0,sgENEstimateItem.Row]));
  except
    on EConvertError do Exit;
  end;
  frmENFactEstimateItemEdit:=TfrmENFactEstimateItemEdit.Create(Application, dsEdit);
  try
    //frmENEstimateItemEdit.rgPlans.ItemIndex := 1;
    //DisableControls([frmENEstimateItemEdit.edtPlanItem, frmENEstimateItemEdit.spbPlanItem, frmENEstimateItemEdit.rgPlans]);

    if  ENEstimateItemObj.planRef <> nil then
    begin
        if ENEstimateItemObj.planRef.code <> low(Integer) then
        begin
            frmENFactEstimateItemEdit.ENPlanWorkCode := ENEstimateItemObj.planRef.code;

            if  ENEstimateItemObj.planItemRef <> nil then
            begin
                if ENEstimateItemObj.planItemRef.code <> low(Integer) then
                    frmENFactEstimateItemEdit.ENPlanWorkItemCode := ENEstimateItemObj.planItemRef.code
                else
                    frmENFactEstimateItemEdit.ENPlanWorkItemCode := -1;
            end
            else
              frmENFactEstimateItemEdit.ENPlanWorkItemCode := -1;
        end
        else
            frmENFactEstimateItemEdit.ENPlanWorkCode := -1;
    end
    else
    begin
       frmENFactEstimateItemEdit.ENPlanWorkCode := -1;
       frmENFactEstimateItemEdit.ENPlanWorkItemCode := -1;
    end;

    //frmENEstimateItemEdit.ENPlanWorkCode := 0;

    if frmENFactEstimateItemEdit.ShowModal= mrOk then
    begin
      //TempENEstimateItem.save(ENEstimateItemObj);
      UpdateGrid(Sender);
    end;
  finally
    frmENEstimateItemEdit.Free;
    frmENEstimateItemEdit:=nil;
  end;
end /// materials
else
if pcEstimate.ActivePage = tsWorkers then
begin
 TempENHumenItem := HTTPRIOENHumenItem as ENHumenItemControllerSoapPort;
   try
     ENHumenItemObj := TempENHumenItem.getObject(StrToInt(sgENHumenItem.Cells[0,sgENHumenItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENHumenItemEdit:=TfrmENHumenItemEdit.Create(Application, dsEdit);
  //DisableControls();
  try
    if frmENHumenItemEdit.ShowModal= mrOk then
      begin
        //TempENHumenItem.save(ENHumenItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENHumenItemEdit.Free;
    frmENHumenItemEdit:=nil;
  end;
end // workers
else
if pcEstimate.ActivePage = tsTransports then
begin
  TempENTransportItem := HTTPRIOENTransportItem as ENTransportItemControllerSoapPort;
  try
     ENTransportItemObj := TempENTransportItem.getObject(StrToInt(sgENTransportItem.Cells[0,sgENTransportItem.Row]));
  except
     on EConvertError do Exit;
  end;


    frmENTransportItemEdit:=TfrmENTransportItemEdit.Create(Application, dsEdit);
    //departmentCode := ENPlanWorkItemObj.
    frmENTransportItemEdit.edtTKTransport.Text := ENTransportItemObj.transport.name;
    try
      if frmENTransportItemEdit.ShowModal = mrOk then
      begin
            //TempENHumenItem.add(ENHumenItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTransportItemEdit.Free;
      frmENTransportItemEdit:=nil;
    end;

end; // transport


end;

procedure TfrmENFactItemEdit.actUpdateExecute(Sender: TObject);
begin
  inherited;
  UpdateGrid(Sender);
end;

procedure TfrmENFactItemEdit.actDeleteExecute(Sender: TObject);
var
  ObjCode, eType: Integer;
  TempENEstimateItem: ENEstimateItemControllerSoapPort;
  TempENHumenItem: ENHumenItemControllerSoapPort;
  TempENTransportItem: ENTransportItemControllerSoapPort;
begin

if pcEstimate.ActivePage = tsMaterials then
begin
     if  Integer(sgENEstimateItem.Objects[0,sgENEstimateItem.Row]) in [ENESTIMATEITEMTYPE_MANUAL_BY_PLAN, ENESTIMATEITEMTYPE_MANUAL_BY_PLANITEM]  then
     begin

       TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
         try
           ObjCode := StrToInt(sgENEstimateItem.Cells[0,sgENEstimateItem.Row]);
         except
         on EConvertError do Exit;
        end;
        if Application.MessageBox(PChar('Вы действительно хотите удалить (Кошторис робіт) ?'),
                          PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
        begin
        {
            eType := DMReports.getElementTypeByEstimateItem(ObjCode);
            case eType of
              1,2,3 : TempENEstimateItem.removeBySRS(ObjCode);
              5 : TempENEstimateItem.removeBySVES(ObjCode);
              6 : TempENEstimateItem.removeBySPS(ObjCode);
              else
              begin
                Application.MessageBox(PChar('Невідомий тип Об"єкту !!!'), PChar('Помилка'), MB_ICONERROR);
                exit;
              end;              
            end;
            }
            TempENEstimateItem.remove(ObjCode);
            UpdateGrid(Sender);
        end;
     end
     else
        Application.MessageBox(PChar('Цю строку неможливо видалити! Змінюйте фактичну кількість або видаляйте строку плану !'),
                          PChar('Увага!'),MB_ICONWARNING);

end // materials
else
if pcEstimate.ActivePage = tsWorkers then
begin
     if  Integer(sgENHumenItem.Objects[0,sgENHumenItem.Row]) in [ENESTIMATEITEMTYPE_MANUAL_BY_PLAN, ENESTIMATEITEMTYPE_MANUAL_BY_PLANITEM]  then
     begin

       TempENHumenItem := HTTPRIOENHumenItem as ENHumenItemControllerSoapPort;
         try
           ObjCode := StrToInt(sgENHumenItem.Cells[0,sgENHumenItem.Row]);
         except
         on EConvertError do Exit;
        end;
        if Application.MessageBox(PChar('Вы действительно хотите удалить (Людські ресурси) ?'),
                          PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
        begin
            TempENHumenItem.remove(ObjCode);
            UpdateGrid(Sender);
        end;
     end
     else
        Application.MessageBox(PChar('Цю строку неможливо видалити! Змінюйте фактичну кількість або видаляйте строку плану !'),
                          PChar('Увага!'),MB_ICONWARNING);
end // workers
else // transport
if pcEstimate.ActivePage = tsTransports then
begin
     if  Integer(sgENTransportItem.Objects[0,sgENTransportItem.Row]) in [ENESTIMATEITEMTYPE_MANUAL_BY_PLAN, ENESTIMATEITEMTYPE_MANUAL_BY_PLANITEM]  then
     begin

       TempENTransportItem := HTTPRIOENTransportItem as ENTransportItemControllerSoapPort;
         try
           ObjCode := StrToInt(sgENTransportItem.Cells[0,sgENTransportItem.Row]);
         except
         on EConvertError do Exit;
        end;
        if Application.MessageBox(PChar('Вы действительно хотите удалить (Транспортні ресурси) ?'),
                          PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
        begin
            TempENTransportItem.remove(ObjCode);
            UpdateGrid(Sender);
        end;
     end
     else
        Application.MessageBox(PChar('Цю строку неможливо видалити! Змінюйте фактичну кількість або видаляйте строку плану !'),
                          PChar('Увага!'),MB_ICONWARNING);
end; // transport


end;

procedure TfrmENFactItemEdit.pcEstimateChange(Sender: TObject);
Var i, j: Integer;
    TempENEstimateItem: ENEstimateItemControllerSoapPort;
    ENEstimateItemList: ENEstimateItemShortList;

    TempENHumenItem: ENHumenItemControllerSoapPort;
    ENHumenItemList: ENHumenItemShortList;
    TempENTransportItem: ENTransportItemControllerSoapPort;
    ENTransportItemList: ENTransportItemShortList;
begin

if pcEstimate.ActivePage = tsMaterials then
begin
 { for i:=1 to sgENEstimateItem.RowCount-1 do
    for j:=0 to sgENEstimateItem.ColCount-1 do
      sgENEstimateItem.Cells[j,i]:='';
  }
  //// Локальний кошторис ////////////////////////////////////////////////////
  SetGridHeaders(ENEstimateItemHeaders, sgENEstimateItem.ColumnHeaders);
  eiColCount := 100;
  TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

  if estimateItemFilter = nil then
  begin
    estimateItemFilter := ENEstimateItemFilter.Create;
    SetNullIntProps(estimateItemFilter);
    SetNullXSProps(estimateItemFilter);
  end;

  //if estimateItemFilter.planRef = nil then estimateItemFilter.planRef := ENPlanWorkRef.Create;
  //estimateItemFilter.planRef.code := ENPlanWorkItemObj.planRef.code;

  if estimateItemFilter.planItemRef = nil then estimateItemFilter.planItemRef := ENPlanWorkItemRef.Create;
  estimateItemFilter.planItemRef.code := ENPlanWorkItemObj.code;

  ENEstimateItemList := TempENEstimateItem.getScrollableFilteredList(estimateItemFilter, 0, -1);

  eiLastCount := High(ENEstimateItemList.list);

  if eiLastCount > -1 then
    sgENEstimateItem.RowCount := eiLastCount + 2
  else
    sgENEstimateItem.RowCount := 2;

  with sgENEstimateItem do
     for i := 0 to eiLastCount do
     begin
       Application.ProcessMessages;

       if ENEstimateItemList.list[i].code <> Low(Integer) then
         Cells[0,i+1] := IntToStr(ENEstimateItemList.list[i].code)
       else
         Cells[0,i+1] := '';

       Cells[1,i+1] := ENEstimateItemList.list[i].materialRefName;

       if ENEstimateItemList.list[i].countGen = nil then
         Cells[2,i+1] := ''
       else
         Cells[2,i+1] := ENEstimateItemList.list[i].countGen.DecimalString;

       if ENEstimateItemList.list[i].countFact = nil then
         Cells[3,i+1] := ''
       else
         Cells[3,i+1] := ENEstimateItemList.list[i].countFact.DecimalString;

       Cells[4,i+1] := ENEstimateItemList.list[i].measureType;

       Cells[5,i+1] := ENEstimateItemList.list[i].typeRefName;

       // Выделяем цветом ручной ввод
       if ENEstimateItemList.list[i].typeRefCode <> ENESTIMATEITEMTYPE_AUTO then
         sgENEstimateItem.RowColor[i+1] := clMoneyGreen; //$EBFFF5

       Objects[0,i+1] := TObject(ENEstimateItemList.list[i].typeRefCode);

       // Выделяем цветом строки, относящиеся ко всей смете
       //if ENEstimateItemList.list[i].planItemRefCode = Low(Integer) then
       //  RowColor[i+1] := clYellow;

       eiLastRow := i + 1;
       sgENEstimateItem.RowCount := eiLastRow + 1;
     end;

   //sgENEstimateItem.RowColor[1] := clGreen;

   eiColCount := eiColCount + 1;
   sgENEstimateItem.Row := 1;
   ///////////////////////////////////////////////////////////////////////////
end// MATERIALS
else
if pcEstimate.ActivePage = tsWorkers then
begin
  {for i:=1 to sgENHumenItem.RowCount-1 do
    for j:=0 to sgENHumenItem.ColCount-1 do
      sgENHumenItem.Cells[j,i]:='';
      }
  SetGridHeaders(ENHumenItemHeaders, sgENHumenItem.ColumnHeaders);

  if humenItemFilter = nil then
  begin
    humenItemFilter := ENHumenItemFilter.Create;
    SetNullIntProps(humenItemFilter);
    SetNullXSProps(humenItemFilter);
  end;

  if HumenItemFilter.planItemRef = nil then HumenItemFilter.planItemRef := ENPlanWorkItemRef.Create;
  HumenItemFilter.planItemRef.code := ENPlanWorkItemObj.code;

  TempENHumenItem := HTTPRIOENHumenItem as ENHumenItemControllerSoapPort;

  ENHumenItemList := TempENHumenItem.getScrollableFilteredList(HumenItemFilter, 0, -1);

  //eiLastCount := High(ENHumenItemList.list);

  if High(ENHumenItemList.list) > -1 then
    sgENHumenItem.RowCount := High(ENHumenItemList.list) + 2
  else
    sgENHumenItem.RowCount := 2;

    {    ( 'Код'
          ,'Посада нормативна'
          ,'Посада штатна'
          ,'Робітник'
          ,'норма часу нормативна'
          ,'норма часу скорегована'
          ,'Ціна нормачасу'
          ,'Вартість нормочасу'
          ,'пользователь внесший изменение'
          ,'дата последнего изменения'
        );
        }
  with sgENHumenItem do
     for i := 0 to High(ENHumenItemList.list) do
     begin
        Application.ProcessMessages;
        if ENHumenItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENHumenItemList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1, i+1] := ENHumenItemList.list[i].positionGenName + ' ' + ENHumenItemList.list[i].positionGenRank + ' розряду';
        Cells[2, i+1] := ENHumenItemList.list[i].finWorkerPositionName;
        Cells[3, i+1] := ENHumenItemList.list[i].finWorkerName;

        if ENHumenItemList.list[i].countGen = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENHumenItemList.list[i].countGen.DecimalString;

        if ENHumenItemList.list[i].countFact = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENHumenItemList.list[i].countFact.DecimalString;
          {
        if ENHumenItemList.list[i].price = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENHumenItemList.list[i].price.DecimalString;
        if ENHumenItemList.list[i].cost = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENHumenItemList.list[i].cost.DecimalString;
        Cells[5,i+1] := ENHumenItemList.list[i].userGen;
        if ENHumenItemList.list[i].dateEdit = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDate2String(ENHumenItemList.list[i].dateEdit);
          }
        //LastRow:=i+1;
        //sgENHumenItem.RowCount:=LastRow+1;

       // Выделяем цветом ручной ввод
       if ENHumenItemList.list[i].typeRefCode <> ENESTIMATEITEMTYPE_AUTO then
         sgENHumenItem.RowColor[i+1] := clMoneyGreen; //$EBFFF5

       Objects[0,i+1] := TObject(ENHumenItemList.list[i].typeRefCode);

  sgENHumenItem.Row := 1;
  end;
end // WORKERSSSSSSSSSS
else
if pcEstimate.ActivePage = tsTransports then
begin
  for i:=1 to sgENTransportItem.RowCount-1 do
    for j:=0 to sgENTransportItem.ColCount-1 do
      sgENHumenItem.Cells[j,i]:='';
  SetGridHeaders(ENTransportItemHeaders, sgENTransportItem.ColumnHeaders);

  if transportItemFilter = nil then
  begin
    transportItemFilter := ENTransportItemFilter.Create;
    SetNullIntProps(transportItemFilter);
    SetNullXSProps(transportItemFilter);
  end;

  if TransportItemFilter.planItemRef = nil then TransportItemFilter.planItemRef := ENPlanWorkItemRef.Create;
  TransportItemFilter.planItemRef.code := ENPlanWorkItemObj.code;

  TempENTransportItem := HTTPRIOENTransportItem as ENTransportItemControllerSoapPort;

  ENTransportItemList := TempENTransportItem.getScrollableFilteredList(TransportItemFilter, 0, -1);

  //eiLastCount := High(ENHumenItemList.list);

  if High(ENTransportItemList.list) > -1 then
    sgENTransportItem.RowCount := High(ENTransportItemList.list) + 2
  else
    sgENTransportItem.RowCount := 2;
           {
        ( 'Код'
          ,'Транспорт нормативний'
          ,'Транспорт штатний'
          ,'Робітник'
          ,'норма часу нормативна'
          ,'норма часу скорегована'
          ,'Ціна нормачасу'
          ,'Вартість нормочасу'
          ,'пользователь внесший изменение'
          ,'дата последнего изменения'
          }
  with sgENTransportItem do
     for i := 0 to High(ENTransportItemList.list) do
     begin
        Application.ProcessMessages;
        if ENTransportItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTransportItemList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1, i+1] := ENTransportItemList.list[i].transportName;
        Cells[2, i+1] := ENTransportItemList.list[i].transportRealName;
        Cells[3, i+1] := ENTransportItemList.list[i].finWorkerName; //workerFactName;
        //Cells[1,i+1] := ENTransportItemList.list[i].

        if ENTransportItemList.list[i].countGen = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENTransportItemList.list[i].countGen.DecimalString;

        if ENTransportItemList.list[i].countFact = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENTransportItemList.list[i].countFact.DecimalString;
{
        if ENTransportItemList.list[i].price = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENTransportItemList.list[i].price.DecimalString;

        if ENTransportItemList.list[i].cost = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENTransportItemList.list[i].cost.DecimalString;

        if ENTransportItemList.list[i].countWorkGen = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENTransportItemList.list[i].countWorkGen.DecimalString;
}

        Cells[6,i+1] := ENTransportItemList.list[i].userGen;

        if ENTransportItemList.list[i].dateEdit = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDate2String(ENTransportItemList.list[i].dateEdit);
        //LastRow:=i+1;
        //sgENHumenItem.RowCount:=LastRow+1;

                       // Выделяем цветом ручной ввод
       if ENTransportItemList.list[i].typeRefCode <> ENESTIMATEITEMTYPE_AUTO then
         sgENTransportItem.RowColor[i+1] := clMoneyGreen; //$EBFFF5

       Objects[0,i+1] := TObject(ENTransportItemList.list[i].typeRefCode);


  sgENTransportItem.Row := 1;
  end;
end; // TRANSPORT

end;

end.
