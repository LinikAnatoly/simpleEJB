
unit EditENCalcPowerReserve;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENCalcPowerReserveController ;

type
  TfrmENCalcPowerReserveEdit = class(TDialogForm)


  HTTPRIOENCalcPowerReserve: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    edtGaugeInfo: TEdit;
    Label1: TLabel;
    spbENFiderGuage: TSpeedButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENFiderGuageClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENCalcPowerReserveEdit: TfrmENCalcPowerReserveEdit;
  ENCalcPowerReserveObj: ENCalcPowerReserve;

implementation

uses ShowENFiderGuage, ENFiderGuageController;


{uses  
    EnergyproController, EnergyproController2, ENCalcPowerReserveController  ;
}
{$R *.dfm}



procedure TfrmENCalcPowerReserveEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     edtGaugeInfo
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    //  edtCode.Text := IntToStr(ENCalcPowerReserveObj.code);
   // edtUserAdd.Text := ENCalcPowerReserveObj.userAdd;
   //   SetDateFieldForDateTimePicker(edtDateAdd, ENCalcPowerReserveObj.dateAdd);
   // edtUserGen.Text := ENCalcPowerReserveObj.userGen;
    //  SetDateFieldForDateTimePicker(edtDateEdit, ENCalcPowerReserveObj.dateEdit);


  end;
end;



procedure TfrmENCalcPowerReserveEdit.spbENFiderGuageClick(
  Sender: TObject);
  var frmENFiderGuageShow : TfrmENFiderGuageShow;
   figFilter : ENFiderGuageFilter;
  begin
  inherited;
   figFilter := ENFiderGuageFilter.Create;
   SetNullIntProps(figFilter);
   SetNullXSProps(figFilter);
   figFilter.conditionSQL := ' code in (' +
                'select g.code from ' +
                '( select  sub04.code as sub_code  from ' +
                ' (select   ( select ccCode   ' +
                ' from dblink(  ''dbname=callcenter port=5432 host=10.77.11.180 user=read password=read'',' +
                ' format(''  select q.code from ccnode q where q.code in (select nodewithallparents_normal(%s))' +
                ' and q.nodetypecode in (2,4,6) and nodetypecode<= ' +
                ' (select nn.nodetypecode from ccnode nn where nn.code=%s) ' +
                ' order by q.nodetypecode desc limit 1'',s2n.ccnodecode, s2n.ccnodecode))'+
                ' as  (ccCode double precision) ) as subNodeCode ' +
                ' from enso2node s2n ' +
                ' where s2n.servicesobjectcode = ' + IntToStr(ENCalcPowerReserveObj.servicesobjectRef.code) + ') as parentSub, ccelementdata ced, enelementdata ed' +
                ' left join ensubstation04 sub04 on (ed.ecode = sub04.elementcode) ' +
                ' where parentsub.subnodecode = ced.code ' +
                ' and ced.elementcode = ed.ecode ' +
                ' and ed.etype = 3 ' +
                ' ) as en_sub left join entransformer tr on (tr.substation04refcode = en_sub.sub_code) ' +
                ' left join enfiderguage g on (g.transformercode = tr.code and g.branchrefcode is null))';

   frmENFiderGuageShow:=TfrmENFiderGuageShow.Create(Application,fmNormal,figFilter);
   DisableActions([ frmENFiderGuageShow.actNoFilter, frmENFiderGuageShow.actEdit, frmENFiderGuageShow.actInsert, frmENFiderGuageShow.actFilter, frmENFiderGuageShow.actDelete]);
   try
      with frmENFiderGuageShow do

        if ShowModal = mrOk then
        begin
            try
               if ENCalcPowerReserveObj.gaugeRef = nil
               then ENCalcPowerReserveObj.gaugeRef := ENFiderGuageRef.Create();
               ENCalcPowerReserveObj.gaugeRef.code := StrToInt(GetReturnValue(sgENFiderGuage,0));
               edtGaugeInfo.Text:= GetReturnValue(sgENFiderGuage,1) + ' (' + GetReturnValue(sgENFiderGuage,3) + '/' +
                                    GetReturnValue(sgENFiderGuage,4) + '/' + GetReturnValue(sgENFiderGuage,5) + ')';

            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENFiderGuageShow.Free;
   end;

end;

procedure TfrmENCalcPowerReserveEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENCalcPowerReserve: ENCalcPowerReserveControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
       edtGaugeInfo
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENCalcPowerReserve := HTTPRIOENCalcPowerReserve as ENCalcPowerReserveControllerSoapPort;


    // ENCalcPowerReserveObj.userAdd := edtUserAdd.Text;

   //  ENCalcPowerReserveObj.dateAdd := GetTXSDateTimeFromTDateTimePicker(edtdateAdd);

    // ENCalcPowerReserveObj.userGen := edtUserGen.Text;

    // ENCalcPowerReserveObj.dateEdit := GetTXSDateTimeFromTDateTimePicker(edtdateEdit);

    if DialogState = dsInsert then
    begin
      ENCalcPowerReserveObj.code:=low(Integer);
      TempENCalcPowerReserve.add(ENCalcPowerReserveObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENCalcPowerReserve.save(ENCalcPowerReserveObj);
    end;
  end;
end;


end.